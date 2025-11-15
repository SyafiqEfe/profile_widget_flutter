// lib/screens/kuis_desain_page.dart

import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
import '../widgets/student_card.dart';
import '../widgets/contact_list.dart';

class KuisDesainPage extends StatelessWidget {
  const KuisDesainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard UI/UX Kuis'),
        elevation: 0.5,
      ),
      // Menggunakan ListView untuk menampung banyak widget (Soal 4 Komposisi)
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const <Widget>[
          // --- BAGIAN ATAS: GridView Kategori (Soal 1 & Soal 4) ---
          Text(
            'Produk Terbaru (GridView)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ProductGrid(), // Widget Soal 1
          SizedBox(height: 25),

          // --- BAGIAN TENGAH: Card Informasi Singkat (Soal 2 & Soal 4) ---
          Text(
            'Kartu Profil Mahasiswa (Card)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          StudentCard(), // Widget Soal 2
          SizedBox(height: 25),

          // --- BAGIAN BAWAH: ListTile Aktivitas (Soal 3 & Soal 4) ---
          Text(
            'Daftar Kontak (ListTile)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ContactList(), // Widget Soal 3
        ],
      ),
    );
  }
}