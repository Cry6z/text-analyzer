# Text Analyzer
Program Lua pertama saya level up LESGO! 🎉  
Sekarang hadir versi web modern dan mode terminal klasik.

## Fitur Utama
- UI web berbasis HTML/CSS dengan tema neon dan visual top 5 kata.
- Input teks multi-baris, hotkey Ctrl+Enter untuk analisis, tombol Reset instan.
- Statistik lengkap: karakter total, tanpa spasi, jumlah kata, kata unik, kata terpanjang/terpendek, rata-rata panjang kata.
- Mode terminal dashboard sebagai fallback untuk lingkungan tanpa browser modern.

## Cara Menjalankan

### 1. Versi Web (disarankan)
1. Buka file `index.html` langsung di browser modern (Chrome, Edge, Firefox) atau pakai Live Server.
2. Ketik/paste teks di panel kiri.
3. Klik **Analisis sekarang** atau tekan **Ctrl+Enter**.
4. Lihat statistik dan grafik batang top 5 kata di panel kanan.

### 2. Versi Terminal
1. Pastikan Lua terpasang.
2. Jalankan:
   ```bash
   lua main.lua
   ```
3. Ketik teksmu.
   - Enter kosong mengakhiri input.
   - Ketik `/keluar` atau `/exit` kapan saja untuk berhenti.
4. Jawab `y` jika ingin analisis lagi.

## Contoh (mode terminal)
```
╔══════════════════════════════════════════════════════╗
║                TEXT ANALYZER TERMINAL                ║
╚══════════════════════════════════════════════════════╝
Tips: Enter kosong selesai input, /keluar untuk mengakhiri program.
Contoh input: gibran suka minum ethanol bersama ilham
──────────────────────────────────────────────────────────────
Ringkasan Statistik
──────────────────────────────────────────────────────────────
Jumlah karakter           39
Karakter tanpa spasi      34
Jumlah kata               6
Jumlah kata unik          6
Rata-rata panjang kata    5.67
Kata terpanjang           ethanol
Kata terpendek            suka
──────────────────────────────────────────────────────────────
Top kata yang sering muncul
  bersama          ███ (1x)
  ethanol          ███ (1x)
  gibran           ███ (1x)
  ilham            ███ (1x)
  minum            ███ (1x)
──────────────────────────────────────────────────────────────
```
