# 📱 BiKoKaCuBe APP

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter" href="https://flutter.dev/">
  <img src="https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android" />
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS" />
</div>

<div align="center">
  <h3>🌟 Biodata • Kontak • Kalkulator • Cuaca • Berita 🌟</h3>
  <p><em>Aplikasi Mobile All-in-One untuk Keperluan Sehari-hari</em></p>
</div>

---

## 📖 Tentang Project

**BiKoKaCuBe** adalah aplikasi mobile yang dikembangkan menggunakan Flutter sebagai bagian dari UTS Pemrograman Mobile. Aplikasi ini mengintegrasikan 5 fitur utama dalam satu platform yang user-friendly dan modern.

### 🎯 Makna Nama BiKoKaCuBe
- **Bi** - Biodata
- **Ko** - Kontak  
- **Ka** - Kalkulator
- **Cu** - Cuaca
- **Be** - Berita

## ✨ Fitur Utama

| Fitur | Deskripsi | Status |
|-------|-----------|--------|
| 👤 **Biodata** | Menampilkan profil pengguna dengan informasi lengkap | ✅ |
| 📞 **Kontak** | Manajemen kontak dengan antarmuka yang intuitif | ✅ |
| 🔢 **Kalkulator** | Kalkulator dengan fungsi matematika dasar | ✅ |
| 🌤️ **Cuaca** | Informasi cuaca terkini (data statis) | ✅ |
| 📰 **Berita** | Portal berita dengan kategori yang beragam (data statis) | ✅ |

## 🛠️ Teknologi yang Digunakan

- **Framework**: Flutter
- **Language**: Dart
- **Development**: Android Studio / VS Code
- **Target Platform**: Android & iOS

## 📱 Screenshot

```
### Splash Screen
![Splash Screen](Screenshot_Apps/splash_screen.jpg)

### Biodata Screen
![Tampilan Biodata Awal](Screenshot_Apps/tampilan_biodata_awal.jpg)

### Input Nama dan Gender
![Isi Nama dan Gender Biodata](Screenshot_Apps/isi_nama_gender_biodata.jpg)

### Input Tanggal Lahir
![Isi Tanggal Lahir Biodata](Screenshot_Apps/isi_tgl_lahir_biodata.jpg)

### Popup Data Tersimpan
![Popup Data Biodata Disimpan](Screenshot_Apps/popup_data_biotada_disimpan.jpg)

### Kontak Screen
![Kontak Screen](Screenshot_Apps/kontak_screen.jpg)

### Kalkulator Screen
![Calculator Screen](Screenshot_Apps/calculator_screen.jpg)

### Cuaca Screen
![Cuaca Screen](Screenshot_Apps/cuaca_screen.jpg)

### Berita Screen
![Berita Screen](Screenshot_Apps/berita_screen.jpg)
```

## 🚀 Instalasi & Setup

### Prerequisites
- Flutter SDK (versi terbaru)
- Dart SDK
- Android Studio / VS Code
- Android SDK / Xcode (untuk iOS)

### Langkah Instalasi
1. **Clone repository**
   ```bash
   git clone https://github.com/NickyAditya/UTS_Mobile_BiKoKaCuBe-APP_NickyAditya.git
   cd UTS_Mobile_BiKoKaCuBe-APP_NickyAditya
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run aplikasi**
   ```bash
   flutter run
   ```

## 📁 Struktur Project
```
app_uts/
├── assets/                  # Images, fonts, dan file lainnya
├── android/                 # Konfigurasi Android
├── ios/                     # Konfigurasi iOS
├── lib/                     # Source code utama
│   └── screens/             # Program Masing-Masing Screen
        ├── berita_page.dart
        ├── biodata_page.dart
        ├── cuaca_page.dart
        ├── dashboard_page.dart
        ├── kalkulator_page.dart
        ├── kontak_page.dart
        ├── splash_screen.dart
    ├── widgets/            # Navbar Button Custom
        ├── custom_bottom_navbar.dart
│   └── main.dart           # Entry point aplikasi
├── linux/                   # Konfigurasi Linux
├── macos/                   # Konfigurasi macOS
├── web/                     # Konfigurasi Web
├── windows/                 # Konfigurasi Windows
└── test/                    # Unit dan widget tests
├── .gitignore                # Git ignore file
├── .metadata                 # Flutter metadata
├── README.md                 # Project documentation
├── analysis_options.yaml     # Dart analysis options
├── pubspec.yaml             # Dependencies dan konfigurasi
├── pubspec.lock             # Lock file untuk dependencies
```

## 🎨 Design & UI/UX

- **Design Pattern**: Material Design
- **Color Scheme**: Modern & Eye-catching
- **Navigation**: Bottom Navigation Bar
- **Responsive**: Mendukung berbagai ukuran layar

## 🔮 Future Updates

- [ ] Integrasi API cuaca real-time
- [ ] Integrasi API berita real-time
- [ ] Database lokal untuk kontak
- [ ] Dark mode theme
- [ ] Notifikasi push
- [ ] Export/Import kontak

## 👨‍💻 Developer

**Nicky Aditya**
- GitHub: [@NickyAditya](https://github.com/NickyAditya)
- Project: UTS Pemrograman Mobile
- Email: nicky.aditya@mhs.itenas.ac.id

## 📄 License

Project ini dibuat untuk keperluan akademik (UTS Pemrograman Mobile).

---

<div align="center">
  <p>Made with ❤️ and ☕ by Nicky Aditya</p>
  <p><em>BiKoKaCuBe - Your All-in-One Mobile Companion</em></p>
</div>
