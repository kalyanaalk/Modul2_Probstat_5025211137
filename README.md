# Modul2_Probstat_5025211137

Praktikum 2 Probabilitas dan Statistika

Senin, 12 Desember 2022

### IDENTITAS

Nama  : Kalyana Putri Al Kanza

NRP   : 5025211137

Kelas : A

## SOAL 1

>Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 

```R
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```

>Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

![image](https://user-images.githubusercontent.com/107338432/207062422-e63c9619-4680-44d4-bada-e92ca5861bbe.png)

### 1-A

>Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

```R
# 1a
selisih = y - x 
stdev = sd(selisih)
```

Didapatkan standar deviasi sama dengan 6.3595947

### 1-B

>Carilah nilai t (p-value)

```R
t = 2 * pt(-abs(( (mean(selisih) - 0) / (stdev / sqrt(9)))), df=8)
```

Didapatkan nilai t (p-value) sama dengan 6.0031793e-05

### 1-C

>Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

```R
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)
```

![WhatsApp Image 2022-12-12 at 9 01 11 PM](https://user-images.githubusercontent.com/107338432/207064899-37bd855e-a813-443d-b563-5af988738944.jpeg)

Didapatkan p-value lebih kecil dari significant level (0.05) sehingga hipotesis nol ditolak dan hipotesis alternatif diterima. Hal ini menunjukkan bahwa aktivitas A memberikan pengaruh signifikan dalam kadar saturasi oksigen.

## SOAL 2

>Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer.

![image](https://user-images.githubusercontent.com/107338432/207083000-9b3370d6-a9ad-4d5d-a78e-3d7fc79a9c40.png)

Step 1 : Menentukan H0 dan H1

H0: mean <= 20000

H1: mean > 20000

Step 2 : Menentukan variabel

```R
mean <- 20000
n <- 100
meanSample <- 23500
sdSample <- 3900
```

Step 3 : Menentukan uji statistik
Karena n > 30, maka menggunakan tabel Z.

Step 4 : Menentukan interval confidence dan nilai kritis
Dianggap alfa = 0.05 karena tidak disebutkan di soal, maka nilai kritis:

```R
nilaiKritis <- qnorm(p=.05, lower.tail = FALSE)
```

Didapatkan nilai kritis 1.64485. Maka, jika didapatkan hasil nilai statistik antara -1.64485 dan 1.64485, H0 diterima. Jika diluar jangkauan tersebuat, H0 ditolak.

Step 5 : Menentukan nilai statistik

```R
z <- (meanSample - mean) / (sdSample / sqrt(n))
```

Didapatkan nilai statistik 8.97436

Step 6 : Menentukan p-value

```R
install.packages("BSDA")
library(BSDA)
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "greater", mu = 20000,
          conf.level = 0.95)
```

Didapatkan nilai p-value sama dengan 2.2e-16

Step 7 : Membuat keputusan dan kesimpulan
Nilai statistik (8.97436) berada di luar rentang -1.64485 hingga 1.64485, sehingga H0 ditolak. Maka, tidak ada bukti yang cukup bahwa mobil dikemudikan rata-rata kurang dari sama dengan 20000 kilometer per tahun. Klaim bahwa mobil dikemudikan rata-rata lebih dari 20000
kilometer per tahun diterima.

### 2-A
>Apakah Anda setuju dengan klaim tersebut?

Setuju.

### 2-B
>Jelaskan maksud dari output yang dihasilkan! 

Didapatkan nilai kritis 1.64485. Maka, jika didapatkan hasil nilai statistik antara -1.64485 dan 1.64485, H0 diterima. Jika diluar jangkauan tersebuat, H0 ditolak.
Didapatkan nilai statistik 8.97436. Nilai statistik berada di luar rentang -1.64485 hingga 1.64485, sehingga H0 ditolak.

### 2-C
>Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Nilai p-value adalah 2.2e-16. Nilai ini lebih kecil dari alfa, sehingga H0 diterima. Maka, tidak ada bukti yang cukup bahwa mobil dikemudikan rata-rata kurang dari sama dengan 20000 kilometer per tahun. Klaim bahwa mobil dikemudikan rata-rata lebih dari 20000
kilometer per tahun diterima.

## Soal 3

>Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

![image](https://user-images.githubusercontent.com/107338432/207097280-712c6dd9-30bd-4583-ada4-579a93077dcc.png)

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)?

![image](https://user-images.githubusercontent.com/107338432/207115630-7631149e-9fd6-4571-ad18-babf3f07aa6d.png)

### 3-A

>H0 dan H1

```R
H0 : meanBandung = meanBali
H1 : meanBandung != meanBali
```

H0 : rata-rata saham bandung sama dengan rata-rata saham Bali
H1 : rata-rata saham bandung tidak sama dengan rata-rata saham Bali

### 3-B

>Hitung Sampel Statistik

```R
alfa <- 0.05
confLevel <- 0.95

nBandung = 19
meanBandung = 3.64
sigmaBandung = 1.67

nBali = 27
meanBali = 2.79
sigmaBali = 1.32

df <- 2
sp <- (((nBandung - 1)*(sigmaBandung^2) + (nBali - 1)*(sigmaBali^2)) / (nBandung + nBali - 2))^(0.5)
```

Didapatkan nilai spool adalah 1.473266.

### 3-C

>Lakukan Uji Statistik

Karena kedua n kurang dari 30, menggunakan tabel t.

```R
tsum.test(mean.x = meanBandung, s.x = sigmaBandung, n.x =  nBandung,
          mean.y = meanBali, s.y = sigmaBali, n.y = nBali, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = confLevel)
```

Didapatkan nilai t sama dengan 1.9267 dan p-value sama dengan 0.06049.

### 3-D

>Nilai Kritikal

```R
nilaiKritis2 <- qt(p = alfa/2, df, lower.tail = FALSE)
```

Menggunakan df = 2 sesuai permintaan soal, didapatkan nilai kritikal sama dengan 4.30265.

### 3-E

>Keputusan

Karena p-value (0.06049) lebih besar dari alfa, maka H0 diterima. 

### 3-F

>Kesimpulan

Tidak ada bukti yang cukup bahwa rata-rata saham Bandung tidak sama dengan rata-rata saham Bali. Klaim bahwa rata-rata saham Bandung sama dengan rata-rata saham Bali diterima.
