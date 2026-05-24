Write-Host "🚀 Memulai Auto Push ke GitHub..." -ForegroundColor Cyan

# Cek apakah Git sudah terinstall
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Git tidak terdeteksi! Silakan instal Git terlebih dahulu di komputermu." -ForegroundColor Red
    Pause
    Exit
}

# Inisialisasi Git jika belum ada
if (!(Test-Path .git)) {
    Write-Host "📦 Menginisialisasi repositori Git lokal..." -ForegroundColor Yellow
    git init
}

# Ubah nama branch utama ke main
git branch -M main

# Cek dan tambah/update remote origin
$remoteExists = git remote | Select-String "origin"
if (!$remoteExists) {
    Write-Host "🔗 Menghubungkan ke repositori GitHub: Zery-Gallanta..." -ForegroundColor Yellow
    git remote add origin https://github.com/Zery-Gallanta/Zery-Gallanta.git
} else {
    Write-Host "🔄 Memperbarui tautan repositori ke Zery-Gallanta..." -ForegroundColor Yellow
    git remote set-url origin https://github.com/Zery-Gallanta/Zery-Gallanta.git
}

# Add semua file
Write-Host "➕ Menambahkan semua berkas..." -ForegroundColor Yellow
git add .

# Commit
Write-Host "💾 Membuat commit berkas..." -ForegroundColor Yellow
git commit -m "feat: initialize professional profile README with Arcane banner and dynamic workflows"

# Push
Write-Host "📤 Mengunggah berkas ke GitHub (branch: main)..." -ForegroundColor Yellow
Write-Host "💡 Catatan: Jika ini pertama kalinya, browser kamu mungkin akan memunculkan popup login GitHub untuk otentikasi." -ForegroundColor Cyan
git push -u origin main --force

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "✅ Selesai! Berkas berhasil diunggah ke GitHub." -ForegroundColor Green
Write-Host "🔗 Silakan cek profil kamu di: https://github.com/Zery-Gallanta" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
Pause
