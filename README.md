# Penerapan Data Mining Untuk Menentukan Faktor Fisiologis sebagai Prediktor Risiko Maternal

Repository ini berisi dokumentasi, analisis data, dan hasil penelitian dengan judul:

> **Penerapan Data Mining Untuk Menentukan Faktor Fisiologis sebagai Prediktor Risiko Maternal**

Penelitian ini menerapkan pendekatan **data mining** untuk mengidentifikasi faktor fisiologis yang berkaitan dengan tingkat risiko kesehatan maternal. Analisis dilakukan menggunakan tahapan **Knowledge Discovery in Data (KDD)**, yang meliputi data preparation, data cleansing, exploratory data analysis (EDA), feature engineering, pemodelan, dan evaluasi.

---

## Authors

- **Asyifa Izzatil Isma**
- **Bella Nadya Aurelia**
- **Leora Natania Klarise Purba**
- **Sanly**
- **Zahra Annisa Afandi**

**Department of Computer Science and Statistics**  
**School of Computer Science**  
**BINUS University**

---

## Research Overview

Kesehatan maternal merupakan salah satu aspek penting dalam kesehatan masyarakat. Deteksi dini terhadap risiko kehamilan dapat membantu mengidentifikasi kondisi yang membutuhkan perhatian lebih lanjut.

Penelitian ini menggunakan pendekatan data mining untuk menganalisis hubungan antara beberapa faktor fisiologis ibu hamil dengan tingkat risiko maternal.

Variabel fisiologis yang dianalisis meliputi:

- Age
- Systolic Blood Pressure (`SystolicBP`)
- Diastolic Blood Pressure (`DiastolicBP`)
- Blood Sugar (`BS`)
- Body Temperature (`BodyTemp`)
- Heart Rate (`HeartRate`)

Sedangkan variabel target yang digunakan adalah:

- `RiskLevel`

---

## Dataset

Dataset yang digunakan dalam penelitian ini berasal dari **UCL Machine Learning Repository**.

Dataset digunakan untuk menganalisis faktor fisiologis yang berkaitan dengan tingkat risiko maternal.

### Target Variable

`RiskLevel` memiliki tiga kategori:

| Risk Level | Keterangan |
|------------|------------|
| 1 | Low Risk |
| 2 | Medium Risk |
| 3 | High Risk |

---

## Variables

| Variable | Description |
|----------|-------------|
| `Age` | Usia ibu hamil |
| `SystolicBP` | Tekanan darah sistolik |
| `DiastolicBP` | Tekanan darah diastolik |
| `BS` | Kadar gula darah |
| `BodyTemp` | Suhu tubuh |
| `HeartRate` | Detak jantung |
| `RiskLevel` | Tingkat risiko maternal |

---

## Methodology

Penelitian menggunakan pendekatan **Knowledge Discovery in Data (KDD)**.

Tahapan utama yang dilakukan adalah:

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
Evaluation
