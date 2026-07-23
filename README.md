# Zeux AI — WhatsApp Auto-Reply Bot

Bot WhatsApp auto-reply berbasis AI (Groq / OpenAI) dengan sistem aktivasi premium.

---

## Persyaratan

- **Termux** (Android) atau Linux
- **Node.js** v18+ → `pkg install nodejs`
- **Git** → `pkg install git`
- **API Key** Groq (gratis) atau OpenAI

---

## Cara Install

```bash
# 1. Clone repo
git clone https://github.com/USERNAME/REPO-NAME.git
cd REPO-NAME

# 2. Buat file .env
cp .env.example .env
nano .env   # isi API key kamu di sini

# 3. Jalankan
bash start.sh
```

---

## Isi file .env

```env
GROQ_API_KEY=gsk_xxxxxxxxxxxxxxxxxxxx
# atau kalau pakai OpenAI:
# OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxx
```

---

## Aktivasi Premium

1. Jalankan bot → bot akan tampilkan **Device ID** kamu
2. Kirim ID tersebut ke admin via WhatsApp untuk aktivasi
3. Setelah diaktifkan, bot langsung berjalan otomatis

---

## Cara Jalankan

```bash
bash start.sh
```

Dari menu pilih **[ 1 ] Jalankan Bot**, scan QR WhatsApp, selesai.

---

## Fitur

- **Mode AI** — balas pesan otomatis pakai Groq / OpenAI
- **Mode Static** — pesan tetap tanpa AI
- **Multi API Key** — fallback otomatis kalau satu key rate-limited
- **Cooldown** — jeda antar balasan per pengirim
- **Whitelist** — batasi hanya nomor tertentu
- **Limit harian** — batas balasan per hari
- **Auto-pause** — bot berhenti balas saat owner membaca chat
- **Remote control** — admin bisa restart / update / ganti config dari panel
