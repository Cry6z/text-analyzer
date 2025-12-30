# Text Analyzer Lua
Project Lua pertama saya LESGO!
Program **Text Analyzer** berbasis **Lua** dengan dua mode penggunaan:  
**Web (HTML/CSS)** dan **Terminal (CLI Dashboard)**.  

---

## Fitur Utama

### Umum
- Analisis teks multi-baris
- Statistik teks lengkap
- Kode Lua rapi dan mudah dikembangkan

### Web
- UI web berbasis **HTML + CSS**
- Input teks multi-baris
- Tombol **Analisis Sekarang**
- Shortcut **Ctrl + Enter**
- Statistik real-time
- Grafik batang **Top 5 kata terbanyak**

### Terminal
- Tampilan dashboard ASCII
- Input teks bebas (multi-baris)
- Perintah khusus:
  - `/keluar` atau `/exit` → keluar program
- Bisa analisis ulang tanpa restart program

---

##Statistik yang Ditampilkan
- Jumlah karakter (total)
- Karakter tanpa spasi
- Jumlah kata
- Jumlah kata unik
- Kata terpanjang
- Kata terpendek
- Rata-rata panjang kata
- Top 5 kata paling sering muncul

---

## Cara Menjalankan

### Versi Web
1. Buka file `index.html` di browser modern  
   *(Chrome / Edge / Firefox)*  
   atau gunakan **Live Server** di VS Code.
2. Ketik atau paste teks di panel kiri.
3. Klik **Analisis Sekarang**  
   atau tekan **Ctrl + Enter**.
4. Hasil analisis dan grafik muncul di panel kanan.

---

### Versi Terminal (CLI)

#### 🔧 Persiapan
- Install **Lua**
- Pastikan Lua sudah terdaftar di PATH

#### ▶ Menjalankan Program
```bash
lua main.lua
