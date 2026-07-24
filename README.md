# Zeux AI — WhatsApp Auto-Reply Bot
Asisten virtual WhatsApp cerdas berbasis AI (**Groq** / **OpenAI**) yang dirancang untuk otomatisasi balasan pesan dengan interaksi yang natural, profesional, dan dilengkapi sistem kontrol penuh.
## 📋 Persyaratan Sistem
Sebelum memulai, pastikan perangkat Anda telah memenuhi beberapa kebutuhan berikut:
 * **Termux** (untuk pengguna Android) atau **Linux / VPS**
 * **Node.js** versi 18 atau lebih baru (pkg install nodejs)
 * **Git** (pkg install git)
 * **API Key** (disarankan menggunakan Groq karena gratis, cepat, dan handal)
## 🚀 Panduan Instalasi
Ikuti langkah-langkah di bawah ini melalui terminal perangkat Anda:
```bash
# 1. Clone repositori bot
git clone https://github.com/USERNAME/REPO-NAME.git
cd REPO-NAME

# 2. Buat file konfigurasi .env
cp .env.example .env

# 3. Buka file .env untuk mengisi API Key Anda
nano .env

```
Di dalam file .env, masukkan API Key Anda sesuai dengan provider yang digunakan:
```env
GROQ_API_KEY=gsk_xxxxxxxxxxxxxxxxxxxx
# Atau jika Anda menggunakan OpenAI:
# OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxx

```
## ⚙️ Cara Menjalankan Bot
 1. Jalankan script utama dengan perintah:
   ```bash
   bash start.sh
   
   ```
 2. Pada menu interaktif yang muncul di terminal, pilih opsi **[ 1 ] Jalankan Bot**.
 3. Scan **QR Code** yang muncul menggunakan perangkat WhatsApp Anda (ketuk menu Perangkat Tertaut > Tautkan Perangkat).
 4. Selesai! Bot kini aktif dan siap berjalan.
## 🔑 Aktivasi Perangkat
> **Catatan:** Jika sistem Anda menggunakan pembatasan akses perangkat, ikuti langkah ini:
> 
 1. Saat pertama kali dijalankan, bot akan menghasilkan dan menampilkan **Device ID** unik di layar terminal Anda.
 2. Salin dan kirimkan Device ID tersebut kepada admin untuk didaftarkan ke dalam sistem.
 3. Setelah diaktifkan oleh admin, bot Anda akan langsung terhubung secara otomatis.
## ✨ Fitur Unggulan
 * **🤖 Mode AI Cerdas** — Membalas pesan secara kontekstual dan dinamis menggunakan model Llama (Groq) atau GPT (OpenAI).
 * **⚡ Mode Static** — Mengirimkan pesan balasan standar (statis) tanpa memanggil API AI.
 * **🔄 Multi API Key Support** — Fitur cadangan (*fallback*) otomatis ke key lain apabila API key utama mengalami *rate-limit*.
 * **⏱️ Cooldown System** — Mengatur jeda waktu pengiriman pesan balasan ke pengirim yang sama untuk mencegah spam.
 * **🛡️ Whitelist Mode** — Membatasi balasan otomatis hanya kepada nomor-nomor tertentu yang diizinkan.
 * **📊 Limit Harian** — Mengatur batasan maksimal jumlah pesan balasan dalam sehari.
 * **⏸️ Auto-Pause** — Bot secara otomatis menunda balasan apabila Anda sedang membaca pesan masuk secara langsung di WhatsApp.
 * **🎛️ Panel Kontrol Jarak Jauh** — Memudahkan pengelolaan sistem, melakukan *restart*, memperbarui versi, hingga mengubah konfigurasi bot dari jarak jauh.
