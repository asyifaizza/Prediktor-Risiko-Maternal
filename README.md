# Penerapan Data Mining Untuk Menentukan Faktor Fisiologis sebagai Prediktor Risiko Maternal

Repository ini berisi kode, dokumentasi, dan hasil penelitian dengan judul:

> **Penerapan Data Mining Untuk Menentukan Faktor Fisiologis sebagai Prediktor Risiko Maternal**

Penelitian ini menerapkan pendekatan **Data Mining** untuk mengidentifikasi faktor fisiologis yang berkaitan dengan tingkat risiko maternal pada ibu hamil. Proses analisis menggunakan tahapan **Knowledge Discovery in Data (KDD)** yang meliputi data preparation, data cleansing, exploratory data analysis (EDA), feature engineering, dan pemodelan.

Analisis berfokus pada beberapa faktor fisiologis, yaitu usia, tekanan darah sistolik dan diastolik, kadar gula darah, suhu tubuh, serta detak jantung, dengan `RiskLevel` sebagai variabel target.

---

## Authors

- **Zahra Annisa Afandi**
- **Leora Natania Klarise Purba**
- **Asyifa Izzatil Isma**
- **Bella Nadya Aurelia**
- **Sanly**

**Department of Computer Science and Statistics**  
**School of Computer Science**  
**BINUS University**

---

## Research Overview

Kesehatan maternal merupakan salah satu aspek penting dalam kesehatan masyarakat karena kondisi ibu selama kehamilan dapat berhubungan dengan kesehatan ibu dan anak.

Deteksi dini terhadap risiko kehamilan dapat membantu mengidentifikasi kondisi yang membutuhkan perhatian lebih lanjut. Oleh karena itu, pendekatan **data mining** dapat digunakan untuk mengeksplorasi pola pada data kesehatan dan mengidentifikasi faktor fisiologis yang berkaitan dengan tingkat risiko maternal.

Penelitian ini menggunakan dataset maternal health untuk menganalisis hubungan antara faktor fisiologis ibu hamil dengan tiga tingkat risiko maternal:

- **Low Risk**
- **Mid Risk**
- **High Risk**

Faktor fisiologis yang dianalisis meliputi:

- `Age`
- `SystolicBP`
- `DiastolicBP`
- `BS`
- `BodyTemp`
- `HeartRate`

Sedangkan variabel target yang digunakan adalah:

- `RiskLevel`

---

## Research Objectives

Penelitian ini bertujuan untuk:

1. Melakukan persiapan dan pembersihan data maternal health sebelum proses analisis.
2. Mengidentifikasi missing values dan outlier pada variabel numerik.
3. Melakukan normalisasi data menggunakan metode **simple feature scaling / min-max normalization**.
4. Mengeksplorasi distribusi dan hubungan antarvariabel fisiologis melalui Exploratory Data Analysis (EDA).
5. Menganalisis hubungan antara faktor fisiologis dengan tingkat risiko maternal.
6. Mengidentifikasi faktor fisiologis yang memiliki hubungan paling kuat dengan `RiskLevel`.

---

## Dataset

Dataset yang digunakan dalam penelitian ini merupakan **Maternal Health Risk Dataset** yang diperoleh dari **UCL Machine Learning Repository**, sebagaimana digunakan dalam penelitian.

Dataset terdiri dari:

- **1,014 observations**
- **7 variables**
- **6 physiological attributes**
- **1 target attribute**

### Target Variable

Variabel `RiskLevel` memiliki tiga kategori:

| Risk Level | Keterangan |
|------------|------------|
| 1 | Low Risk |
| 2 | Mid Risk |
| 3 | High Risk |

Dalam proses data preparation, kategori `RiskLevel` dikonversi menjadi nilai numerik untuk kebutuhan analisis.

---

## Variables

| Variable | Description | Role |
|----------|-------------|------|
| `Age` | Usia ibu hamil | Predictor |
| `SystolicBP` | Tekanan darah sistolik | Predictor |
| `DiastolicBP` | Tekanan darah diastolik | Predictor |
| `BS` | Kadar gula darah | Predictor |
| `BodyTemp` | Suhu tubuh | Predictor |
| `HeartRate` | Detak jantung | Predictor |
| `RiskLevel` | Tingkat risiko maternal | Target |

---

# Methodology

Penelitian menggunakan pendekatan **Knowledge Discovery in Data (KDD)**.

Tahapan utama penelitian adalah:

```text
Data Preparation
       ↓
Data Cleansing
       ↓
Exploratory Data Analysis (EDA)
       ↓
Feature Engineering
       ↓
Modeling
       ↓
Analysis & Interpretation
```

---

## 1. Data Preparation

Tahap data preparation dilakukan untuk mempersiapkan dataset sebelum memasuki proses data cleansing dan analisis.

Variabel yang digunakan sebagai predictor adalah:

```text
Age
SystolicBP
DiastolicBP
BS
BodyTemp
HeartRate
```

Sedangkan variabel target adalah:

```text
RiskLevel
```

Pada tahap ini juga dilakukan pemeriksaan terhadap struktur dataset, dimensi data, nama variabel, serta tipe data.

---

## 2. Data Cleansing

Data cleansing dilakukan untuk memastikan kualitas dataset sebelum digunakan dalam analisis.

### Missing Values

Pemeriksaan missing value dilakukan pada seluruh variabel.

Hasil pemeriksaan menunjukkan bahwa **tidak terdapat missing value** pada dataset.

Seluruh variabel memiliki kelengkapan data sebesar **100%**.

### Outlier Detection

Pemeriksaan outlier dilakukan pada variabel numerik menggunakan **boxplot**.

Handling outlier dilakukan menggunakan metode **Interquartile Range (IQR)**.

Batas outlier dihitung menggunakan:

```text
Lower Bound = Q1 - 1.5 × IQR

Upper Bound = Q3 + 1.5 × IQR
```

Proses penghapusan outlier dilakukan secara bertahap pada beberapa variabel.

Jumlah data setelah proses penghapusan outlier yang dilaporkan dalam penelitian:

| Variable | Number of Observations |
|----------|------------------------|
| Initial Dataset | 1,014 |
| After Age Outlier Removal | 1,013 |
| After HeartRate Outlier Removal | 1,012 |
| After SystolicBP Outlier Removal | 997 |
| After BS Outlier Removal | 773 |

Setelah proses data cleansing, dilakukan pemeriksaan kembali terhadap dataset untuk memastikan tidak terdapat missing value.

---

## 3. Data Normalization

Setelah proses data cleansing, dilakukan normalisasi untuk mengubah rentang nilai variabel numerik tanpa menghilangkan informasi dari data.

Penelitian menggunakan **simple feature scaling / min-max normalization** sehingga nilai ditransformasikan ke dalam rentang **0 hingga 1**.

Formula normalisasi:

```text
x' = (x - min(x)) / (max(x) - min(x))
```

Normalisasi dilakukan sebagai bagian dari proses preprocessing sebelum analisis lebih lanjut.

---

# Exploratory Data Analysis

Exploratory Data Analysis (EDA) dilakukan untuk memahami karakteristik dataset serta hubungan antara faktor fisiologis dan tingkat risiko maternal.

Analisis mencakup distribusi variabel, hubungan antarvariabel, distribusi `RiskLevel`, serta visualisasi pola data.

---

## Age Distribution

Histogram digunakan untuk melihat distribusi usia ibu hamil.

Berdasarkan hasil penelitian, mayoritas ibu hamil berada pada rentang usia **20–30 tahun**, dengan frekuensi tertinggi berada di sekitar **20–25 tahun**.

Distribusi usia menunjukkan pola **right-skewed**, dengan jumlah observasi pada usia yang lebih tinggi relatif lebih sedikit dibandingkan kelompok usia muda.

---

## Age and Systolic Blood Pressure

Scatter plot digunakan untuk melihat hubungan antara:

- `Age`
- `SystolicBP`

dengan pengelompokan berdasarkan `RiskLevel`.

Hasil eksplorasi menunjukkan bahwa pada kelompok usia yang lebih muda, sebagian besar observasi memiliki tekanan darah sistolik pada rentang sekitar **80–120 mmHg**.

Pada kelompok usia yang lebih tinggi, tekanan darah sistolik terlihat lebih bervariasi dan beberapa observasi mencapai sekitar **140 mmHg atau lebih**.

Pola tersebut menunjukkan adanya kecenderungan peningkatan tekanan darah sistolik seiring bertambahnya usia, meskipun hubungan tersebut tidak berlaku secara mutlak untuk seluruh observasi.

---

## Risk Level Distribution

Distribusi `RiskLevel` divisualisasikan menggunakan bar chart.

Berdasarkan hasil penelitian:

- **Risk Level 1 (Low Risk)** memiliki jumlah observasi paling tinggi.
- **Risk Level 2 (Mid Risk)** memiliki jumlah observasi lebih rendah dibandingkan Risk Level 1.
- **Risk Level 3 (High Risk)** memiliki jumlah observasi paling sedikit.

Dengan demikian, sebagian besar observasi dalam dataset berada pada kategori **risiko rendah hingga sedang**, sedangkan kategori risiko tinggi memiliki proporsi yang relatif lebih kecil.

---

## Correlation Analysis

Correlation heatmap digunakan untuk menganalisis hubungan antarvariabel numerik.

Beberapa hasil korelasi yang dibahas dalam penelitian adalah:

| Variable Pair | Correlation |
|---------------|-------------|
| `RiskLevel` – `DiastolicBP` | 0.22 |
| `RiskLevel` – `SystolicBP` | 0.22 |
| `RiskLevel` – `HeartRate` | -0.12 |
| `RiskLevel` – `Age` | 0.04 |
| `SystolicBP` – `DiastolicBP` | 0.74 |

Hasil tersebut menunjukkan bahwa:

- `SystolicBP` memiliki korelasi positif dengan `RiskLevel`.
- `DiastolicBP` memiliki korelasi positif dengan `RiskLevel`.
- `HeartRate` memiliki korelasi negatif yang relatif kecil dengan `RiskLevel`.
- `Age` memiliki korelasi yang rendah dengan `RiskLevel`.
- `SystolicBP` dan `DiastolicBP` memiliki korelasi yang relatif kuat satu sama lain.
- `BodyTemp` menunjukkan korelasi yang sangat rendah dengan variabel lainnya.

Berdasarkan analisis korelasi yang dilakukan dalam penelitian, **tekanan darah sistolik dan diastolik merupakan variabel yang memiliki hubungan paling kuat dengan `RiskLevel` dibandingkan variabel fisiologis lainnya**.

---

# Modeling

## Random Forest

Selain analisis eksploratif, kode penelitian juga mengimplementasikan algoritma **Random Forest** untuk menganalisis tingkat kepentingan variabel.

Model menggunakan enam faktor fisiologis sebagai predictor:

```text
Age
SystolicBP
DiastolicBP
BS
BodyTemp
HeartRate
```

dengan:

```text
RiskLevel
```

sebagai target.

Random Forest dibangun menggunakan **500 trees** dan parameter `importance = TRUE` untuk menghasilkan informasi mengenai feature importance.

Implementasi model terdapat pada `code.R`.

---

## Feature Importance

Feature importance digunakan untuk melihat kontribusi relatif masing-masing variabel fisiologis dalam model Random Forest.

Variabel yang dianalisis meliputi:

- `Age`
- `SystolicBP`
- `DiastolicBP`
- `BS`
- `BodyTemp`
- `HeartRate`

Visualisasi feature importance dihasilkan menggunakan fungsi:

```r
varImpPlot(rf_model)
```

Hasil feature importance dapat digunakan sebagai analisis tambahan untuk melihat variabel mana yang paling berperan dalam model.

> Analisis utama yang dilaporkan dalam paper menggunakan hasil EDA dan correlation analysis. Oleh karena itu, hasil feature importance Random Forest diposisikan sebagai bagian dari implementasi model pada `code.R`.

---

# Main Findings

Berdasarkan hasil analisis dan pembahasan dalam penelitian, beberapa temuan utama adalah:

### 1. Blood Pressure

`SystolicBP` dan `DiastolicBP` memiliki korelasi positif yang sama-sama sebesar **0.22** terhadap `RiskLevel`.

Hal ini menunjukkan bahwa tekanan darah memiliki hubungan yang lebih kuat dengan tingkat risiko maternal dibandingkan beberapa faktor fisiologis lainnya.

### 2. Relationship Between SystolicBP and DiastolicBP

`SystolicBP` dan `DiastolicBP` memiliki korelasi sebesar **0.74**, yang menunjukkan hubungan yang relatif kuat antara kedua komponen tekanan darah.

### 3. Age

`Age` memiliki korelasi yang rendah terhadap `RiskLevel`, yaitu sebesar **0.04**.

### 4. Heart Rate

`HeartRate` memiliki korelasi negatif kecil terhadap `RiskLevel`, yaitu sebesar **-0.12**.

### 5. Body Temperature

`BodyTemp` menunjukkan korelasi yang sangat rendah dengan variabel lainnya, termasuk `RiskLevel`.

### 6. Risk Distribution

Sebagian besar observasi berada pada kategori **Low Risk** dan **Mid Risk**, sedangkan observasi dengan kategori **High Risk** relatif lebih sedikit.

---

# Conclusion

Penelitian ini mengidentifikasi **tekanan darah sistolik dan diastolik** sebagai faktor fisiologis yang memiliki hubungan paling kuat dengan tingkat risiko maternal dalam dataset yang dianalisis.

Hasil exploratory data analysis dan correlation analysis menunjukkan bahwa kedua variabel tekanan darah memiliki korelasi positif dengan `RiskLevel`, sementara variabel seperti `Age`, `HeartRate`, dan `BodyTemp` menunjukkan hubungan yang lebih rendah.

Proses data mining dilakukan melalui tahapan KDD yang mencakup data preparation, data cleansing, normalization, exploratory data analysis, serta pemodelan menggunakan Random Forest.

Hasil penelitian memberikan gambaran mengenai faktor fisiologis yang dapat diprioritaskan dalam analisis risiko maternal berdasarkan karakteristik dataset yang digunakan.

> **Disclaimer:** Hasil penelitian ini merupakan hasil analisis dataset dan tidak dimaksudkan sebagai alat diagnosis medis atau sebagai pengganti pemeriksaan dan konsultasi dengan tenaga kesehatan profesional.

---

# Tools & Technologies

Penelitian ini menggunakan **R** sebagai bahasa pemrograman dan beberapa package untuk data analysis, visualization, serta machine learning.

### Main Packages

```r
library(visdat)
library(ggplot2)
library(reshape2)
library(randomForest)
```

### Technologies

- R
- RStudio
- ggplot2
- visdat
- reshape2
- randomForest

---

# Repository Structure

```text
Prediktor-Risiko-Maternal/
│
├── code.R
├── Paper.pdf
└── README.md
```

### File Description

| File | Description |
|------|-------------|
| `code.R` | Script utama untuk data preparation, data cleansing, normalization, EDA, correlation analysis, Random Forest, dan feature importance |
| `Paper.pdf` | Artikel penelitian yang mendokumentasikan metodologi, hasil analisis, dan pembahasan |
| `README.md` | Dokumentasi project |

---

# How to Run

## 1. Clone Repository

```bash
git clone https://github.com/asyifaizza/Prediktor-Risiko-Maternal.git
cd Prediktor-Risiko-Maternal
```

## 2. Open the Project

Buka repository menggunakan **RStudio**.

## 3. Install Required Packages

Jalankan kode berikut pada R console:

```r
install.packages("visdat")
install.packages("ggplot2")
install.packages("reshape2")
install.packages("randomForest")
```

## 4. Open `code.R`

Buka file:

```text
code.R
```

kemudian jalankan kode secara berurutan.

## 5. Load Dataset

Pada bagian data preparation, dataset dapat dipilih menggunakan file selection yang tersedia pada script.

Pastikan dataset **Maternal Health Risk** tersedia sebelum menjalankan seluruh analisis.

