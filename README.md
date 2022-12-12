# Modul2_Probstat_5025211137

Praktikum 2 Probabilitas dan Statistika

Senin, 12 Desember 2022

### IDENTITAS

Nama  : Kalyana Putri Al Kanza

NRP   : 5025211137

Kelas : A

## SOAL 1

![image](https://user-images.githubusercontent.com/107338432/207062422-e63c9619-4680-44d4-bada-e92ca5861bbe.png)


>Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 
```R
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
>Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

###1-A

>Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

```R
# 1a
selisih = y - x 
stdev = sd(selisih)
```

####Keterangan
Didapatkan standar deviasi sama dengan 6.3595947

###1-B

>Carilah nilai t (p-value)

```R
t = 2 * pt(-abs(( (mean(selisih) - 0) / (stdev / sqrt(9)))), df=8)
```

####Keterangan
Didapatkan nilai t (p-value) sama dengan 6.0031793e-05

###1-C

>Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

```R
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE, conf.level = 0.95)
```

####Keterangan
![WhatsApp Image 2022-12-12 at 9 01 11 PM](https://user-images.githubusercontent.com/107338432/207064899-37bd855e-a813-443d-b563-5af988738944.jpeg)

Didapatkan p-value lebih kecil dari significant level (0.05) sehingga hipotesis nol ditolak dan hipotesis alternatif diterima. Hal ini menunjukkan bahwa aktivitas A memberikan pengaruh signifikan dalam kadar saturasi oksigen.

