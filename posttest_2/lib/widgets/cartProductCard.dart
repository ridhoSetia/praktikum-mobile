// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Widget CartProductCard: Komponen reusable khusus untuk menampilkan item produk di dalam keranjang belanja
class CartProductCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String initialQuantity;
  final String imagePath;

  const CartProductCard({
    super.key,
    this.productName = 'Nama Produk',
    this.productDescription = 'Deskripsi Singkat',
    this.productPrice = 'Rp12.000.000',
    this.initialQuantity = '1',
    this.imagePath = 'assets/product.png',
  });

  @override
  Widget build(BuildContext context) {
    // Widget Container: Pembungkus kartu item keranjang dengan border dan padding
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      // Widget Row: Menyusun gambar produk, informasi detail, dan input jumlah secara horizontal
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Widget ClipRRect: Memotong sudut gambar agar memiliki sudut melengkung halus
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // Widget Image: Digunakan untuk menampilkan gambar produk dari folder assets
            child: Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          ),

          // Widget SizedBox: Memberikan jarak horizontal antara gambar dan informasi produk
          const SizedBox(width: 16),

          // Widget Expanded: Membuat informasi produk mengisi ruang fleksibel yang tersedia
          Expanded(
            // Widget Column: Menyusun teks nama produk, deskripsi singkat, dan harga secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget Text: Menampilkan nama produk di keranjang
                Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                ),

                // Widget SizedBox: Memberikan jarak vertikal antara nama dan deskripsi
                const SizedBox(height: 4),

                // Widget Text: Menampilkan deskripsi singkat atau kategori produk
                Text(
                  productDescription,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),

                // Widget SizedBox: Memberikan jarak vertikal antara deskripsi dan harga
                const SizedBox(height: 8),

                // Widget Text: Menampilkan harga produk dengan tulisan tebal
                Text(
                  productPrice,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4D96FF)),
                ),
              ],
            ),
          ),

          // Widget SizedBox: Memberikan jarak horizontal antara informasi produk dan input kuantitas
          const SizedBox(width: 12),

          // Widget SizedBox: Mengatur ukuran tetap wadah input kuantitas produk
          SizedBox(
            width: 48,
            height: 48,
            // Widget TextField: Input angka untuk mengatur kuantitas produk Mengatur input angka pada TextField
            child: TextField(
              // keyboardType TextInputType.number: Membatasi input keyboard khusus angka
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: TextEditingController(text: initialQuantity),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              decoration: InputDecoration(
                hintText: '1',
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF4D96FF), width: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
