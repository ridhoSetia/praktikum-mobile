// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../main.dart';

// Widget ProductCard: Komponen reusable untuk menampilkan kartu produk pada katalog
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Widget Container: Kartu pembungkus produk dengan warna latar putih & border standar
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      // Widget Column: Menyusun isi kartu secara vertikal (wadah gambar netral atas, informasi bawah)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget Container: Wadah placeholder gambar produk dengan warna abu-abu netral
          Container(
            width: double.infinity,
            height: 110.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9), // Abu-abu placeholder standar
              border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0)),
            ),
          ),

          // Widget Padding: Ruang batas di sekeliling teks dan detail produk
          Padding(
            padding: const EdgeInsets.all(10.0),
            // Widget Column: Menyusun teks informasi produk secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget Row: Baris badge kategori dan rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Widget Container: Tag kategori komponen dengan warna netral
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.grey.shade300, width: 0.5),
                      ),
                      // Widget Text: Kategori produk
                      child: Text(
                        product['category'] as String,
                        style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
                      ),
                    ),
                    // Widget Text: Nilai rating produk
                    Text(
                      '${product['rating']}',
                      style: const TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold, color: Color(0xFFD97706)),
                    ),
                  ],
                ),

                // Widget SizedBox: Memberi jarak vertikal
                const SizedBox(height: 6.0),

                // Widget Text: Nama spesifik produk komponen elektronik
                Text(
                  product['name'] as String,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.darkSlate, height: 1.25),
                ),

                // Widget SizedBox: Memberi jarak vertikal
                const SizedBox(height: 4.0),

                // Widget Row: Keterangan ketersediaan stok
                Row(
                  children: [
                    // Widget Text: Keterangan stok dan produk terjual
                    Text('${product['stock']}', style: TextStyle(fontSize: 10.0, color: Colors.grey.shade600)),
                  ],
                ),

                // Widget SizedBox: Memberi jarak vertikal
                const SizedBox(height: 6.0),

                // Widget Text: Harga produk komponen dengan warna Electric Blue
                Text(
                  product['price'] as String,
                  style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800, color: AppColors.electricBlue),
                ),

                // Widget SizedBox: Memberi jarak vertikal sebelum tombol
                const SizedBox(height: 8.0),

                // --- TOMBOL KERANJANG BELANJA ---
                // Widget Container: Tombol interaktif untuk memasukkan ke keranjang
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product['name']} berhasil ditambahkan ke keranjang!', style: const TextStyle(fontSize: 12.0, color: Colors.white)),
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.darkSlate,
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(color: AppColors.electricBlue, borderRadius: BorderRadius.circular(8.0)),
                    alignment: Alignment.center,
                    // Widget Text: Label aksi pada tombol keranjang
                    child: const Text(
                      'Masukkan Keranjang',
                      style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
