# DATA PRE-PROCESSING #

library(visdat)

# Untuk mengakses dataset (membaca file csv)
dataset <- file.choose()
dataset[0:5,]

# Untuk melihat dimensi data
dim(dataset) # dalam file csv tersebut terdapat data sebanyak 7 kolom dan 1014 baris
names(dataset) # untuk mengetahui nama-nama variabel dalam dataset

# Untuk encode kategori "RiskLevel" jadi "low risk" -> 1, "mid risk" -> 2, "high risk" -> 3
dataset$RiskLevel <- as.numeric(factor(dataset$RiskLevel,
                                       levels = c("low risk", "mid risk", "high risk"),
                                       labels = c(1, 2, 3)))
str(dataset) # untuk mengetahui tipe data masing-masing variabel dalam dataset

jumlah_data_RiskLevel <- table(dataset$RiskLevel) # untuk menghitung jumlah tiap kategori dalam variabel RiskLevel
print(jumlah_data_RiskLevel) # untuk menampilkan jumlahnya

# Untuk mengecek missing value dalam dataset
sapply(dataset, function(x) sum(is.na(x)))
vis_miss(dataset) # visualisasi dari jumlah data yang missing value

# Untuk mengecek outlier
number_cols <- unlist(lapply(dataset, is.numeric))
dataset_num <- dataset[ , number_cols]
boxplot(dataset_num, main = "Boxplot Maternal Health Risk Data Set")

# Function untuk remove outlier dari masing-masing variabel
remove_outlier <- function(data, variable_name){
  quartiles <- quantile(data[[variable_name]], probs = c(0.25, 0.75), na.rm = TRUE)
  IQR <- IQR(data[[variable_name]], na.rm = TRUE)
  
  Lower <- quartiles[1] - 1.5 * IQR # percentile 5% batas bawah
  Upper <- quartiles[2] + 1.5 * IQR # percentile 95% batas atas
  
  return(subset(data, data[[variable_name]] > Lower & data[[variable_name]] < Upper))
}

# Untuk remove outlier dari variabel Age
data_no_outlier_Age <- remove_outlier(dataset, "Age")
dim(data_no_outlier_Age) # setelah remove outlier dari variabel Age, data menjadi sebanyak 1013 baris
# ini boxplotnya kalau gamau pake, dihapus aja yaaa
par(mfrow = c(1, 2))
boxplot(dataset$Age, main = "Sebelum Remove Outlier Age", col = "lightblue")
boxplot(data_no_outlier_Age$Age, main = "Setelah Remove Outlier Age", col = "yellow")
par(mfrow = c(1, 1))

# Untuk remove outlier dari variabel SystolicBP
data_no_outlier_SystolicBP <- remove_outlier(dataset, "SystolicBP")
dim(data_no_outlier_SystolicBP) # setelah remove outlier dari variabel SystolicBP, data menjadi sebanyak 997 baris
par(mfrow = c(1, 2))
boxplot(dataset$SystolicBP, main = "Sebelum Remove Outlier SystolicBP", col = "lightblue")
boxplot(data_no_outlier_SystolicBP$SystolicBP, main = "Setelah Remove Outlier SystolicBP", col = "yellow")
par(mfrow = c(1, 1))

# Untuk remove outlier dari variabel BS
data_no_outlier_BS <- remove_outlier(dataset, "BS")
dim(data_no_outlier_BS) # setelah remove outlier dari variabel BS, data menjadi sebanyak 804 baris
# ini boxplotnya kalau gamau pake, dihapus aja yaaa
par(mfrow = c(1, 2))
boxplot(dataset$BS, main = "Sebelum Remove Outlier BS", col = "lightblue")
boxplot(data_no_outlier_BS$BS, main = "Setelah Remove Outlier BS", col = "yellow")
par(mfrow = c(1, 1))

# Untuk remove outlier dari variabel BodyTemp
data_no_outlier_BodyTemp <- remove_outlier(dataset, "BodyTemp")
dim(data_no_outlier_BodyTemp) # setelah remove outlier dari variabel BodyTemp, data menjadi sebanyak 0 baris
# ini boxplotnya kalau gamau pake, dihapus aja yaaa
par(mfrow = c(1, 2))
boxplot(dataset$BodyTemp, main = "Sebelum Remove Outlier BodyTemp", col = "lightblue")
if(nrow(data_no_outlier_BodyTemp) > 0){
  boxplot(data_no_outlier_BodyTemp$BodyTemp, main = "Setelah Remove Outlier BodyTemp", col = "yellow")
}
par(mfrow = c(1, 1))

# Untuk remove outlier dari variabel HeartRate
data_no_outlier_HeartRate <- remove_outlier(dataset, "HeartRate")
dim(data_no_outlier_HeartRate) # setelah remove outlier dari variabel HeartRate, data menjadi sebanyak 1012 baris
# ini boxplotnya kalau gamau pake, dihapus aja yaaa
par(mfrow = c(1, 2))
boxplot(dataset$HeartRate, main = "Sebelum Remove Outlier HeartRate", col = "lightblue")
boxplot(data_no_outlier_HeartRate$HeartRate, main = "Setelah Remove Outlier HeartRate", col = "yellow")
par(mfrow = c(1, 1))

# Normalisasi data numerical min max
dataset_num <- dataset[, sapply(dataset, is.numeric)]
dataset_minmax_normalization <- as.data.frame(lapply(dataset_num, function(x){
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}))
head(dataset_minmax_normalization)

# Normalisasi data numerical z score
dataset_zScore_normalization <- as.data.frame(lapply(dataset_num, function(x){
  (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
}))
head(dataset_zScore_normalization)



# VISUALISASI DATA 
# menggunakan data yang sudah bersih 
data_clean <- read.csv("/Users/macbook/Downloads/Dataset Cleaned.csv")
data_clean

library(ggplot2)
install.packages("reshape2")
library(reshape2)
library(randomForest)
install.packages("randomForest")

# 1 Histogram untuk mengetahui distribusi data numerik
ggplot(data_clean, aes(x = Age)) + 
  geom_histogram(binwidth = 5, fill = "lightpink2", color = "antiquewhite") +
  ggtitle("Distribusi Umur") +
  xlab("Umur") +
  ylab("Frekuensi") +
  theme_minimal()

# 2 Boxplot untuk membandingkan variabel numerik berdasarkan kategori RiskLevel
ggplot(data_clean, aes(x = factor(RiskLevel), y = SystolicBP, fill = factor(RiskLevel))) +
  geom_boxplot() +
  ggtitle("Distribusi SystolicBP berdasarkan RiskLevel") +
  xlab("Risk Level") +
  ylab("SystolicBP") +
  scale_fill_manual(values = c("blueviolet", "deeppink2", "skyblue")) + 
  theme_minimal()


# 3 Heatmap untuk mengetahui korelasi antar variabel numerik
num_vars <- data_clean[, sapply(data_clean, is.numeric)]
cor_matrix <- cor(num_vars, use = "complete.obs")
melted_cor_matrix <- melt(cor_matrix)

ggplot(melted_cor_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "plum", high = "orchid", mid = "white", midpoint = 0) +
  ggtitle("Korelasi Antar Variabel") +
  xlab("") +
  ylab("") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 4 Scatter Plot untuk mengetahui hubungan antar variabel
ggplot(data_clean, aes(x = Age, y = SystolicBP, color = factor(RiskLevel))) +
  geom_point(alpha = 0.7) +
  ggtitle("Hubungan Age dan SystolicBP berdasarkan RiskLevel") +
  xlab("Age") +
  ylab("SystolicBP") +
  scale_color_manual(values = c("deeppink", "orchid", "bisque2")) +
  theme_minimal()

# 5 Bar Chart untuk kategori RiskLevel
ggplot(data_clean, aes(x = factor(RiskLevel), fill = factor(RiskLevel))) +
  geom_bar() +
  ggtitle("Jumlah Observasi Berdasarkan RiskLevel") +
  xlab("Risk Level") +
  ylab("Jumlah") +
  scale_fill_manual(values = c("deeppink3", "pink2", "lightpink")) +
  theme_minimal()

# 6 Menghitung proporsi kategori RiskLevel
risk_counts <- table(data_clean$RiskLevel)
# Membuat pie chart
pie(risk_counts, 
    main = "Proportion of Risk Levels", 
    col = c("deeppink3", "lightpink", "bisque"),
    labels = paste0(names(risk_counts), " (", round(100 * prop.table(risk_counts), 1), "%)"))

# 7. Menghitung korelasi
# Menghitung matriks korelasi
numeric_vars <- sapply(data_clean, is.numeric)
correlation_matrix <- cor(data_clean[, numeric_vars], use = "complete.obs")

# Mengonversi matriks korelasi untuk visualisasi
cor_melt <- melt(correlation_matrix)

# Membuat heatmap korelasi
ggplot(cor_melt, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2)), color = "white") +
  scale_fill_gradient2(low = "blueviolet", high = "orchid", mid = "beige", midpoint = 0) +
  theme_minimal() +
  ggtitle("Heatmap Korelasi Data Maternal Health Risk")

# 8 Model Random Forest
# Melatih model Random Forest
rf_model <- randomForest(factor(RiskLevel) ~ Age + SystolicBP + DiastolicBP + BS + BodyTemp + HeartRate,
                         data = data_clean, importance = TRUE, ntree = 500)

# Visualisasi pentingnya fitur
varImpPlot(rf_model, main = "Pentingnya Fitur (Random Forest)")
