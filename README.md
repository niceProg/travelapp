# Travel App - Flutter

🚀 **Travel App** adalah aplikasi mobile yang dibuat menggunakan Flutter untuk menampilkan daftar perjalanan wisata dengan informasi lengkap seperti judul, foto, harga, rating, ulasan, dan detail perjalanan.

## ✨ Fitur Utama
- **Daftar Perjalanan**: Menampilkan daftar 5 perjalanan wisata dengan informasi harga, rating, dan gambar.
- **Detail Perjalanan**: Halaman khusus yang menampilkan detail lengkap dari perjalanan yang dipilih.
- **Pencarian**: Fitur pencarian untuk mempermudah pengguna menemukan perjalanan yang mereka inginkan.
- **UI Responsif**: Desain yang ramah pengguna dan mirip dengan aplikasi seperti Tiket.com.

## 📷 Preview
(Opsional: Tambahkan screenshot aplikasi di sini)

## 🛠️ Teknologi yang Digunakan
- **Flutter 3.27**
- **Dart**
- **Provider (State Management)**
- **HTTP Package (Untuk Fetch Data)**
- **Tailwind CSS (Untuk referensi styling dalam mockup Figma)**

## 📂 Struktur Folder
```
travel_app/
│-- assets/
│   ├── data/
│   │   ├── trips.json
│-- lib/
│   ├── core/
│   │   ├── theme.dart
│   ├── features/
│   │   ├── home/
│   │   │   ├── presentation/
│   │   │   │   ├── pages/
│   │   │   │   │   ├── home_page.dart
│   │   ├── trip/
│   │   │   ├── data/
│   │   │   │   ├── trip_repository.dart
│   │   │   ├── domain/
│   │   │   │   ├── models/
│   │   │   │   │   ├── trip_model.dart
│   │   │   ├── presentation/
│   │   │   │   ├── pages/
│   │   │   │   │   ├── trip_detail_page.dart
│   │   │   │   ├── providers/
│   │   │   │   │   ├── trip_provider.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── trip_card.dart
│   │   │   │   │   ├── trip_info.dart
│   │-- utils/
│   │   │-- custom_cache_manager.dart
│   ├── main.dart
│-- pubspec.yaml
```

## 🔧 Cara Menjalankan Aplikasi
1. Clone repository ini
```bash
git clone https://github.com/username/travelapp.git
cd travelapp
```

2. Install dependencies
```bash
flutter pub get
```

3. Jalankan aplikasi di emulator atau perangkat fisik
```bash
flutter run
```

## 📦 Build APK/IPA
Untuk membuat file APK:
```bash
flutter build apk --release
```

Untuk membuat file IPA (iOS):
```bash
flutter build ios --release
```

## 📌 Data Contoh (Sample Data)
```json
[
     {
          "id": "1",
          "title": "Bali Beach Getaway",
          "imageUrl": "https://drive.google.com/uc?export=view&id=157VsgDzgIopoRxP8ed6r6h2VDRY9lkNQ",
          "price": 1500000.0,
          "originalPrice": 2000000.0,
          "rating": 4.8,
          "reviewCount": 12000,
          "location": "Bali, Indonesia",
          "summary": "Enjoy the beautiful beaches of Bali with our exclusive package.",
          "includes": ["Hotel", "Breakfast", "Tour Guide", "Flight Tickets"],
          "excludes": ["Personal Expenses"],
          "terms": "Non-refundable, must book 7 days in advance.",
          "passengers": 2
     }
]
```

## 🤝 Kontribusi
Jika ingin berkontribusi, silakan buat **pull request** atau laporkan bug di **Issues**.

## 📜 Lisensi
Proyek ini menggunakan lisensi **MIT License**.

---
Dibuat dengan ❤️ oleh Wisnu Yumna Yudhanta