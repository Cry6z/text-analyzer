# Text Analyzer (Lua)

Project Lua pertama saya 

---

## Gambaran Cepat
- Analisis teks multi-baris dengan statistik lengkap
- Dua mode penggunaan: browser (HTML/CSS) dan CLI
- Visualisasi Top 5 kata paling sering muncul
- Bisa analisis ulang tanpa perlu restart

---

## Fitur Utama

### Umum
- Analisis teks multi-baris
- Statistik lengkap (kata, karakter, rata-rata panjang, unik, dll.)
- Struktur kode modular, gampang diutak-atik

### Mode Web
- UI HTML + CSS yang responsif
- Panel input teks luas
- Tombol **Analisis Sekarang** + shortcut **Ctrl + Enter**
- Statistik diperbarui real-time
- Grafik batang interaktif untuk Top 5 kata

### Mode Terminal (CLI)
- Dashboard ASCII dengan highlight yang rapi
- Input multi-baris langsung dari terminal
- Perintah cepat:
  - `/keluar` atau `/exit` → tutup program
- Bisa menjalankan analisis berulang tanpa keluar aplikasi

---

## Statistik yang Ditampilkan
- Jumlah karakter (dengan & tanpa spasi)
- Jumlah kata & kata unik
- Kata terpanjang dan terpendek
- Rata-rata panjang kata
- Top 5 kata terpopuler

---

## Screenshot

| Mode | Tampilan | Keterangan |
| --- | --- | --- |
| Web UI | <img src="https://github.com/user-attachments/assets/ddf36f70-eb19-441b-b5bc-89d151b455ba" alt="Dashboard Web Text Analyzer" width="640" /> | Panel input di kiri, statistik & grafik batang Top 5 kata di kanan. |
| CLI Dashboard | <img src="https://github.com/user-attachments/assets/bb376cef-b994-4bb8-8e10-eabf9d468598" alt="Tampilan CLI Text Analyzer" width="640" /> | Dashboard ASCII dengan statistik lengkap dan perintah `/keluar`. |

---

## Cara Menjalankan

### 1. Versi Web
1. Buka `index.html` di browser modern (Chrome / Edge / Firefox)  
   atau pakai **Live Server** di VS Code.
2. Ketik atau paste teks ke panel kiri.
3. Tekan **Analisis Sekarang** atau shortcut **Ctrl + Enter**.
4. Statistik dan grafik akan muncul di panel kanan.

### 2. Versi Terminal (CLI)

#### Persiapan
- Install **Lua**
- Pastikan perintah `lua` sudah ada di PATH

#### Menjalankan Program
```bash
lua main.lua
```

Masukkan teksmu, tekan Enter dua kali untuk mengakhiri input, lalu lihat hasil analisisnya.

---

## Tech Stack
- **Lua** 
- **HTML + CSS** 
- **Vanilla JS**

---
