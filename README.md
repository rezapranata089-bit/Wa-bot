<p align="center">
  <img src="https://images.unsplash.com/photo-1614741118887-7a4ee193a5fa?q=80&w=1000&auto=format&fit=crop" alt="Zeux AI Banner" width="100%">
</p>

# Zeux AI — WhatsApp Auto-Reply Bot

Bot WhatsApp yang bisa membalas pesan secara otomatis menggunakan AI (Groq atau OpenAI). Cocok bagi Anda yang sering menerima banyak pesan namun tidak sempat membalas satu per satu. Biarkan bot menangani interaksi awal, dan Anda dapat melanjutkan komunikasi jika diperlukan.

Bot ini dirancang agar balasan terasa natural dan kontekstual. Dilengkapi dengan sistem kontrol lengkap untuk mengatur siapa yang boleh dibalas, batasan harian, hingga fitur auto-pause saat Anda sedang membaca chat secara langsung.

---

## Daftar Isi

- [Fitur](#fitur)
- [Persiapan](#persiapan)
- [Instalasi](#instalasi)
- [Konfigurasi](#konfigurasi)
- [Menjalankan Bot](#menjalankan-bot)
- [Aktivasi Perangkat](#aktivasi-perangkat)
- [Struktur Folder](#struktur-folder)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Disclaimer](#disclaimer)
- [Lisensi](#lisensi)

---

## Fitur

| Fitur | Penjelasan |
|---|---|
| **Mode AI** | Balasan dibuat kontekstual menggunakan model Llama (Groq) atau GPT (OpenAI) |
| **Mode Static** | Bot mengirimkan balasan tetap tanpa memanggil API AI |
| **Multi API Key** | Otomatis beralih ke key cadangan jika key utama mencapai batas limit |
| **Cooldown** | Mengatur jeda antar balasan ke nomor yang sama untuk mencegah spam |
| **Whitelist Mode** | Bot hanya akan membalas nomor-nomor yang telah diizinkan |
| **Limit Harian** | Membatasi jumlah maksimal balasan otomatis per hari |
| **Auto-Pause** | Bot otomatis berhenti jika Anda sedang membuka chat tersebut dari perangkat utama |

---

## Persiapan

Sebelum memulai, pastikan hal-hal berikut sudah tersedia di perangkat Anda:

- **Termux** (untuk pengguna Android) atau **Linux / VPS**
- **Node.js** versi 18 ke atas
- **Git**
- **API Key** dari Groq atau OpenAI (Groq lebih disarankan karena gratis dan responsif)

Jika Node.js dan Git belum terpasang di Termux, jalankan perintah berikut:

```bash
pkg update && pkg upgrade
```

```bash
pkg install nodejs git -y
```

Verifikasi instalasi Node.js:

```bash
node -v
```

---

## Instalasi

Ikuti langkah-langkah di bawah ini secara berurutan:

**1. Clone repositori**

```bash
git clone https://github.com/rezapranata089-bit/Wa-bot.git
```

**2. Masuk ke direktori proyek**

```bash
cd Wa-bot
```

**3. Instal dependensi**

```bash
npm install
```

**4. Salin file konfigurasi contoh**

```bash
cp .env.example .env
```

**5. Edit file .env**

```bash
nano .env
```

> Setelah selesai mengedit, tekan `CTRL + X`, lalu `Y`, kemudian `Enter` untuk menyimpan.

---

## Konfigurasi

Isi API key pada file `.env` sesuai dengan provider yang Anda gunakan. Pilih salah satu saja.

**Opsi Groq (Disarankan):**

```env
GROQ_API_KEY=gsk_xxxxxxxxxxxxxxxxxxxx
```

**Opsi OpenAI:**

```env
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxx
```

Variabel konfigurasi lainnya:

| Variabel | Fungsi | Penjelasan Detail | Contoh |
|---|---|---|---|
| `MODE` | Mode Balasan | Menentukan cara bot membalas. Gunakan `ai` untuk balasan cerdas berbasis teks, atau `static` untuk balasan pesan tetap yang sudah ditentukan. | `ai` |
| `COOLDOWN_SECONDS` | Jeda Balasan | Durasi waktu tunggu (dalam detik) sebelum bot membalas pesan kembali ke nomor yang sama. Berguna untuk menghindari spam dan agar terlihat lebih natural. | `60` |
| `DAILY_LIMIT` | Batas Harian | Jumlah maksimal pesan yang akan dibalas bot secara otomatis dalam satu hari (24 jam). Setelah limit tercapai, bot akan berhenti membalas hingga hari berikutnya. | `100` |
| `WHITELIST_MODE` | Mode Izin Khusus | Jika diatur ke `true`, bot hanya akan merespons nomor-nomor yang terdaftar di `WHITELIST_NUMBERS`. Jika `false`, bot merespons semua pesan masuk. | `true` |
| `WHITELIST_NUMBERS` | Daftar Nomor | Daftar nomor WhatsApp yang diizinkan untuk mendapatkan balasan otomatis (khusus jika `WHITELIST_MODE` aktif). Gunakan format kode negara tanpa tanda plus. | `62812xxxx,62813xxxx` |
| `AUTO_PAUSE` | Jeda Otomatis | Menghentikan sementara balasan otomatis jika Anda sedang aktif membuka atau membalas chat secara manual dari perangkat utama Anda. | `true` |
| `AI_MODEL` | Model AI | Memilih model bahasa spesifik yang ingin digunakan (misalnya: `llama3-8b-8192` untuk Groq atau `gpt-3.5-turbo` untuk OpenAI). | `llama3-8b-8192` |

---

## Menjalankan Bot

**1. Jalankan script utama**

```bash
bash start.sh
```

**2. Pilih menu**

Pada menu interaktif, masukkan angka sesuai pilihan:

```text
[ 1 ] Jalankan Bot
```

**3. Pindai QR Code**

Buka WhatsApp di ponsel Anda -> **Perangkat Tertaut** -> **Tautkan Perangkat** -> arahkan kamera ke QR Code yang muncul di terminal.

Setelah pemindaian berhasil, bot akan aktif dan mulai memantau pesan masuk.

---

## Aktivasi Perangkat

Jika sistem menerapkan pembatasan akses per perangkat, ikuti langkah berikut:

1. Bot akan menampilkan **Device ID** unik di terminal saat dijalankan pertama kali.
2. Salin Device ID tersebut dan kirimkan ke admin untuk didaftarkan.
3. Setelah diaktifkan oleh admin, bot akan terhubung secara otomatis.

---

## Struktur Folder

Gambaran umum struktur proyek:

```text
Wa-bot/
├── start.sh          # Script utama untuk menjalankan bot
├── .env.example       # Contoh file konfigurasi
├── .env                # Konfigurasi aktif (jangan dibagikan)
├── src/                # Kode sumber utama
├── session/            # Data sesi WhatsApp (bersifat rahasia)
└── package.json
```

---

## Troubleshooting

**QR Code tidak muncul atau gagal dipindai**
Hapus folder `session/`, lalu jalankan kembali `bash start.sh`.

**Bot tidak memberikan balasan**
Pastikan `WHITELIST_MODE` sesuai dengan kebutuhan. Jika aktif, pastikan nomor pengirim sudah terdaftar di `WHITELIST_NUMBERS`.

**Terjadi error rate-limit**
Tambahkan API key cadangan di `.env` atau tunggu beberapa saat hingga limit direset oleh provider.

**Perintah node tidak dikenali**
Instal kembali dengan `pkg install nodejs -y`, lalu mulai ulang sesi terminal Anda.

---

## FAQ

**Apakah ini menggunakan WhatsApp API resmi?**
Tidak. Bot ini menggunakan pustaka WhatsApp Web pihak ketiga. Terdapat risiko pembatasan akun jika digunakan secara berlebihan. Gunakan dengan bijak.

**Dapatkah bot berjalan 24 jam?**
Ya, selama perangkat atau VPS tetap menyala dan terhubung ke internet. Pada Termux, gunakan `termux-wake-lock` agar proses tidak terhenti saat layar terkunci.

**Groq atau OpenAI, mana yang lebih baik?**
Groq menawarkan kecepatan tinggi dan akses gratis, sangat cocok untuk penggunaan harian. OpenAI cenderung memberikan kualitas jawaban yang lebih matang namun bersifat berbayar.

---

## Disclaimer

Proyek ini dibuat untuk tujuan otomatisasi pribadi dan pembelajaran. Penggunaan pustaka WhatsApp tidak resmi memiliki risiko terhadap akun Anda. Pahami risiko tersebut sebelum menggunakan nomor utama. Kami tidak bertanggung jawab atas segala bentuk pembatasan akun yang mungkin terjadi.

---

## Lisensi

Proyek ini dirilis di bawah lisensi **MIT**.

---

<p align="center">Dibuat oleh tim Zeux AI</p>
