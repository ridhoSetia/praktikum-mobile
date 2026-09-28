// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'main.dart';
import 'widgets/cartProductCard.dart';

// Widget CartPage: Halaman keranjang belanja untuk menampilkan daftar item yang dipilih pengguna
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Scaffold: Menyediakan kerangka dasar halaman (body dan bottomNavigationBar)
    return Scaffold(
      backgroundColor: AppColors.background,

      // Widget AppBar: Bar bagian atas halaman yang menampilkan judul dan tombol kembali
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Keranjang Belanja',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkSlate),
        ),
        // Tombol kembali manual di AppBar menggunakan Navigator.pop
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.darkSlate, size: 20),
          onPressed: () {
            // Navigator.pop: Digunakan untuk kembali ke halaman sebelumnya dengan menghapus halaman aktif dari navigation stack ""
            Navigator.pop(context);
          },
        ),
      ),

      // Widget SafeArea: Memastikan konten tidak tertutup notch atau area status bar
      body: SafeArea(
        // Widget Column: Menyusun search bar dan konten utama secara vertikal
        child: Column(
          children: [
            // --- SEARCH BAR SECTION ---
            // Widget Padding: Memberikan jarak keliling di sekitar search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              // Widget Container: Wadah untuk TextField pencarian dengan styling border melengkung
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                // Widget TextField: Input pencarian interaktif pada halaman keranjang
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari barang di keranjang...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13.5),
                    prefixIcon: const Icon(Icons.search, color: AppColors.electricBlue, size: 22),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Icon(Icons.tune, size: 20, color: Colors.grey.shade400),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                ),
              ),
            ),

            // --- DAFTAR PRODUK KERANJANG & CHECKOUT BAR ---
            // Widget Expanded: Memaksa area daftar produk dan checkout bar memenuhi sisa ruang vertikal
            Expanded(
              // Widget Stack: Digunakan untuk menumpuk beberapa widget pada area yang sama ""
              // Widget yang ditulis lebih awal berada di belakang, sedangkan widget berikutnya berada di atasnya
              child: Stack(
                children: [
                  // --- DAFTAR ITEM KERANJANG (Di lapisan bawah) ---
                  // Widget SingleChildScrollView: Memberikan kemampuan scroll vertikal pada daftar item keranjang
                  SingleChildScrollView(
                    // Widget Padding: Memberikan jarak dan ruang bawah (bottom 100) agar item paling bawah tidak tertutup checkout bar
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 100.0),
                    // Widget Column: Menyusun deretan kartu item keranjang secara berurutan ke bawah
                    child: Column(
                      children: const [
                        // Widget CartProductCard: Komponen terpisah di folder widget khusus untuk item keranjang
                        CartProductCard(
                          productName: 'Motor driver L298N untuk DC Motor',
                          productDescription: 'Motor DC - Torsi Rendah',
                          productPrice: 'Rp 145.000',
                          initialQuantity: '2',
                          imagePath: 'assets/l298n.jpeg',
                        ),

                        // Widget SizedBox: Memberikan jarak vertikal antar kartu item keranjang
                        SizedBox(height: 12.0),

                        // Widget CartProductCard: Item keranjang kedua
                        CartProductCard(
                          productName: 'ESP32 NodeMCU CP2102 WiFi + Bluetooth',
                          productDescription: 'Mikrokontroler - IoT Development',
                          productPrice: 'Rp 78.500',
                          initialQuantity: '1',
                          imagePath: 'assets/esp32-nodemcu.jpeg',
                        ),

                        // Widget SizedBox: Memberikan jarak vertikal
                        SizedBox(height: 12.0),

                        // Widget CartProductCard: Item keranjang ketiga
                        CartProductCard(
                          productName: 'Arduino Uno R3 ATmega328P + Kabel USB',
                          productDescription: 'Mikrokontroler - Original Board',
                          productPrice: 'Rp 95.000',
                          initialQuantity: '1',
                          imagePath: 'assets/arduino-uno-r3.jpeg',
                        ),
                      ],
                    ),
                  ),

                  // --- BOTTOM CHECKOUT / TOTAL BAR (Di lapisan atas Stack) ---
                  // Widget Positioned: Digunakan untuk mengatur posisi widget di dalam Stack ""
                  // Menempelkan kotak total harga dan tombol checkout di posisi paling bawah layar (bottom: 0)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // Widget Container: Wadah informasi total harga dan tombol checkout
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                      // Widget BoxDecoration: Menata warna latar belakang dan efek bayangan (BoxShadow)
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // Widget BoxShadow: Memberikan efek bayangan pada widget agar terlihat memiliki kedalaman ""
                        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10, offset: const Offset(0, -3))],
                      ),
                      // Widget Row: Menyusun info total dan tombol proses checkout secara mendatar
                      child: Row(
                        children: [
                          // Widget Expanded: Mengalokasikan ruang untuk teks total harga
                          Expanded(
                            // Widget Column: Menyusun teks label 'Total' dan nilai nominal harga secara vertikal
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                // Widget Text: Label teks penanda total belanja
                                Text(
                                  'Total Belanja',
                                  style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
                                ),

                                // Widget SizedBox: Jarak vertikal kecil
                                SizedBox(height: 2.0),

                                // Widget Text: Nilai total kalkulasi harga produk di keranjang
                                Text(
                                  'Rp 483.500',
                                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColors.electricBlue),
                                ),
                              ],
                            ),
                          ),

                          // Widget SizedBox: Memberikan jarak horizontal antara teks total dan tombol
                          const SizedBox(width: 14.0),

                          // Widget Expanded: Mengalokasikan ruang proporsional untuk tombol checkout
                          Expanded(
                            flex: 1,
                            // Widget SizedBox: Mengatur tinggi tombol agar serasi dan mudah ditekan
                            child: SizedBox(
                              height: 44.0,
                              // Widget ElevatedButton: Tombol aksi utama untuk melanjutkan transaksi pembayaran
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesanan Anda sedang diproses!'), backgroundColor: AppColors.darkSlate));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.darkSlate,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                ),
                                // Widget Row: Menyusun ikon keranjang dan teks tombol secara horizontal
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Widget Icon: Ikon tas belanja / checkout
                                    Icon(Icons.shopping_bag_outlined, size: 18.0),

                                    // Widget SizedBox: Jarak horizontal antara ikon dan teks
                                    SizedBox(width: 8.0),

                                    // Widget Text: Label teks aksi tombol checkout
                                    Text('Checkout', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // --- NAVIGATION BAR SECTION ---
      // Widget NavigationBar: Komponen Navigation Bar modern (Material 3) untuk navigasi antar halaman
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: 1, // Index 1 menandakan halaman Keranjang aktif
        onDestinationSelected: (index) {
          if (index == 0) {
            // Navigator.pop: Digunakan untuk kembali ke halaman sebelumnya (Beranda) dengan menghapus halaman aktif dari navigation stack ""
            Navigator.pop(context);
          } else if (index == 2) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Halaman Profil Pengguna'), duration: Duration(seconds: 1)));
          }
        },
        destinations: const [
          // Widget NavigationDestination: Item destinasi navigasi menu Beranda
          NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
          // Widget NavigationDestination: Item destinasi navigasi menu Keranjang
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          // Widget NavigationDestination: Item destinasi navigasi menu Profil
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
