import 'package:flutter/material.dart';

import 'widgets/productCard.dart';

void main() {
  runApp(const CncStoreApp());
}

class AppColors {
  static const Color coralRed = Color(0xFFFF6B6B);
  static const Color warmYellow = Color(0xFFFFD93D);
  static const Color freshGreen = Color(0xFF6BCB77);
  static const Color electricBlue = Color(0xFF4D96FF);
  static const Color darkSlate = Color(0xFF1E293B);
  static const Color background = Color(0xFFF8FAFC);
}

// Widget MaterialApp: Root widget aplikasi yang mengatur konfigurasi global, tema, dan halaman awal
class CncStoreApp extends StatelessWidget {
  const CncStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cncstore - Penjualan Komponen Elektronik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.electricBlue, primary: AppColors.electricBlue, secondary: AppColors.warmYellow),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index aktif untuk Bottom Navigation Bar
  int _selectedNavIndex = 0;

  // Data produk komponen elektronik dan CNC
  final List<Map<String, dynamic>> _products = [
    {'name': 'NEMA 17 Stepper Motor 42BYGH 1.5A', 'category': 'Motor & CNC', 'code': 'CNC-MTR-017', 'price': 'Rp 145.000', 'rating': '4.9', 'sold': '1.2k terjual', 'stock': 'Tersedia 48 pcs'},
    {
      'name': 'ESP32 NodeMCU CP2102 WiFi + Bluetooth',
      'category': 'Mikrokontroler',
      'code': 'MCU-ESP32-30P',
      'price': 'Rp 78.500',
      'rating': '4.8',
      'sold': '3.4k terjual',
      'stock': 'Tersedia 120 pcs',
    },
    {'name': 'CNC Shield V3 Kit + 4x A4988 Driver', 'category': 'Driver Motor', 'code': 'KIT-SHIELD-A49', 'price': 'Rp 115.000', 'rating': '4.9', 'sold': '850 terjual', 'stock': 'Tersedia 24 pcs'},
    {'name': 'TB6600 Driver Motor Stepper 4A 9-42V', 'category': 'Driver Motor', 'code': 'DRV-TB6600-4A', 'price': 'Rp 89.000', 'rating': '4.7', 'sold': '620 terjual', 'stock': 'Tersedia 15 pcs'},
    {
      'name': 'Sensor Ultrasonik HC-SR04 Jarak Presisi',
      'category': 'Sensor & Modul',
      'code': 'SNS-HCSR04-5V',
      'price': 'Rp 16.500',
      'rating': '4.8',
      'sold': '2.1k terjual',
      'stock': 'Tersedia 200 pcs',
    },
    {'name': 'Arduino Uno R3 ATmega328P + Kabel USB', 'category': 'Mikrokontroler', 'code': 'MCU-UNO-R3', 'price': 'Rp 95.000', 'rating': '4.9', 'sold': '5.0k terjual', 'stock': 'Tersedia 85 pcs'},
  ];

  @override
  Widget build(BuildContext context) {
    // Widget Scaffold: Struktur dasar tata letak halaman mobile (appBar, body, bottomNavigationBar, backgroundColor)
    return Scaffold(
      backgroundColor: AppColors.background,
      // Widget SafeArea: Menjaga konten agar tidak terhalang oleh notch kamera atau status bar atas
      body: SafeArea(
        // Widget SingleChildScrollView: Menyediakan kemampuan scrolling vertikal untuk seluruh konten halaman
        child: SingleChildScrollView(
          // Widget Padding: Memberikan ruang batas keliling (margin internal) di seluruh konten utama
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          // Widget Column: Menyusun seluruh komponen halaman secara vertikal dari atas ke bawah
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SECTION (Logo Brand & Notifikasi) ---
              // Widget Row: Menyusun logo brand dan ikon notifikasi secara horizontal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Widget Row: Mengelompokkan teks nama toko
                  Row(
                    children: [
                      // Widget SizedBox: Memberikan jarak horizontal
                      const SizedBox(width: 4.0),
                      // Widget Column: Menyusun teks nama toko dan status toko secara vertikal
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Widget Row: Nama Brand dan indikator status online
                          Row(
                            children: [
                              // Widget Text: Nama Brand Toko
                              const Text(
                                'cncstore',
                                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800, color: AppColors.darkSlate, letterSpacing: -0.5),
                              ),
                              // Widget SizedBox: Jarak kecil
                              const SizedBox(width: 6.0),
                            ],
                          ),
                          // Widget Text: Sub-deskripsi identitas toko
                          Text(
                            'Komponen Elektronika & Otomasi CNC',
                            style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Widget Container: Wadah ikon notifikasi dengan border sederhana sesuai Modul 2
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    // Widget Padding: Padding internal untuk tombol notifikasi
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // Stack ikon notifikasi dengan titik Coral Red
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Widget Icon: Ikon lonceng notifikasi
                          Icon(Icons.notifications_outlined, color: Colors.grey.shade800, size: 22.0),
                          // Titik penanda notifikasi baru warna Coral Red
                          Positioned(
                            top: -1,
                            right: -1,
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: const BoxDecoration(color: AppColors.coralRed, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Widget SizedBox: Memberi jarak vertikal antar komponen
              const SizedBox(height: 18.0),

              // --- SEARCH BAR SECTION ---
              // Widget Container: Wadah input pencarian dengan border sederhana
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                // Widget TextField: Input pencarian interaktif untuk mencari komponen elektronik
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari stepper motor, Arduino, sensor, driver...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13.5),
                    // Widget Icon: Ikon kaca pembesar warna Electric Blue
                    prefixIcon: const Icon(Icons.search, color: AppColors.electricBlue, size: 22.0),
                    // Widget Padding: Menata posisi ikon filter di ujung kanan
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      // Widget Icon: Ikon filter parameter pencarian
                      child: Icon(Icons.tune, color: AppColors.electricBlue, size: 20.0),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                ),
              ),

              // Widget SizedBox: Memberi jarak vertikal
              const SizedBox(height: 18.0),

              // --- PROMO / HERO BANNER SECTION ---
              // Widget Container: Banner promosi dengan warna solid sesuai modul
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(color: AppColors.electricBlue, borderRadius: BorderRadius.circular(14.0)),
                // Widget Row: Membagi layout banner
                child: Row(
                  children: [
                    // Widget Expanded: Memaksa area teks mengisi ruang yang tersedia secara penuh
                    Expanded(
                      // Widget Column: Menyusun teks judul banner promo secara bertingkat
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Widget Container: Badge penanda promo resmi warna Warm Yellow
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(color: AppColors.warmYellow, borderRadius: BorderRadius.circular(6.0)),
                            // Widget Text: Label badge penawaran khusus
                            child: const Text(
                              'OFFICIAL CNC STORE',
                              style: TextStyle(color: Color(0xFF0F172A), fontSize: 9.5, fontWeight: FontWeight.w800, letterSpacing: 0.8),
                            ),
                          ),
                          // Widget SizedBox: Memberi jarak vertikal
                          const SizedBox(height: 8.0),
                          // Widget Text: Judul penawaran promo warna putih tebal
                          const Text(
                            'Kit IoT & Robotika Diskon 20%',
                            style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.3),
                          ),
                          // Widget SizedBox: Memberi jarak vertikal
                          const SizedBox(height: 6.0),
                          // Widget Text: Keterangan tambahan promo
                          Text('Spesial untuk proyek otomasi industri & hobi elektronika.', style: TextStyle(color: Colors.white.withValues(alpha: 0.90), fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Widget SizedBox: Memberi jarak vertikal menuju katalog produk
              const SizedBox(height: 22.0),

              // --- HEADER DAFTAR PRODUK ---
              // Widget Row: Baris judul bagian katalog dan badge total produk
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Widget Text: Judul list produk
                  const Text(
                    'Katalog Produk Komponen',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColors.darkSlate),
                  ),
                  // Widget Container: Badge kecil total produk dengan border sederhana
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    // Widget Text: Total item
                    child: const Text(
                      '6 Komponen',
                      style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.electricBlue),
                    ),
                  ),
                ],
              ),

              // Widget SizedBox: Memberi jarak vertikal
              const SizedBox(height: 12.0),

              // --- DAFTAR PRODUK (Tampilan 2 Kolom per Baris Menggunakan Row & Expanded) ---
              // Widget Column: Menyusun baris-baris produk secara vertikal
              Column(
                children: [
                  for (int i = 0; i < _products.length; i += 2) ...[
                    // Widget Row: Membagi tampilan 1 baris menjadi 2 kolom produk yang sejajar
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Widget Expanded: Kolom pertama (kiri) mengisi 50% ruang baris menggunakan ProductCard terpisah
                        Expanded(child: ProductCard(product: _products[i])),

                        // Widget SizedBox: Memberikan jarak horizontal antar kolom produk
                        const SizedBox(width: 12.0),

                        // Widget Expanded: Kolom kedua (kanan) mengisi 50% ruang baris berikutnya
                        Expanded(child: (i + 1 < _products.length) ? ProductCard(product: _products[i + 1]) : const SizedBox()),
                      ],
                    ),

                    // Widget SizedBox: Memberikan jarak vertikal antar baris produk
                    const SizedBox(height: 12.0),
                  ],
                ],
              ),

              // Widget SizedBox: Jarak penutup di bagian bawah halaman
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR SECTION (Sesuai Modul 2 Halaman 3 & 8) ---
      // Widget Scaffold properti bottomNavigationBar: Navigasi bawah halaman
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.electricBlue,
        unselectedItemColor: Colors.grey.shade400,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11.0),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            // Widget Icon: Ikon navigasi menu Beranda
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            // Widget Icon: Ikon navigasi menu Keranjang Belanja
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            // Widget Icon: Ikon navigasi menu Profil Pengguna
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
