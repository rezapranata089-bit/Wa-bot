#!/data/data/com.termux/files/usr/bin/bash
# ╔══════════════════════════════════════════╗
# ║   Zeux AI WA Bot — Starter Script       ║
# ║   Cara pakai: bash start.sh             ║
# ╚══════════════════════════════════════════╝

# Abaikan SIGINT (Ctrl+C) di level shell supaya sesi Termux tidak
# ikut tertutup saat bot dihentikan dari dalam menu Node.js.
trap '' SIGINT

# Pindah otomatis ke folder script ini berada
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
cd "$SCRIPT_DIR" || { echo "[ERROR] Gagal masuk ke folder bot."; exit 1; }

# Cek apakah Node.js tersedia
if ! command -v node &>/dev/null; then
    echo ""
    echo "  [ERROR] Node.js tidak ditemukan!"
    echo "  Install dulu dengan perintah: pkg install nodejs"
    echo ""
    exit 1
fi

# Install dependencies otomatis jika belum ada
if [ ! -d "node_modules" ]; then
    echo ""
    echo "  ⏳ Pertama kali jalan — menginstall dependencies..."
    echo "  (ini hanya sekali, berikutnya langsung jalan)"
    echo ""
    npm install
    echo ""
fi

# Bersihkan layar sebelum jalan
clear
printf '\033[2J\033[H'

# Jalankan bot (auto-restart kalau exit, misal abis git pull dari Dev Tool)
while true; do
    node menu.mjs --start
    EXIT_CODE=$?
    echo ""
    if [ -f ".stop_requested" ]; then
        rm -f ".stop_requested"
        echo "  🛑 Dihentikan manual (Ctrl+C). Tidak auto-restart."
        break
    fi
    echo "  ⚠️  Bot berhenti (exit code $EXIT_CODE). Restart dalam 2 detik..."
    sleep 2
done
