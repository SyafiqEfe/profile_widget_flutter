// lib/screens/home_navigator_page.dart

import 'package:flutter/material.dart';
import 'kuis_desain_page.dart';
import 'github_profile_screen.dart';

class HomeNavigatorPage extends StatelessWidget {
  const HomeNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilihan Tugas Pemrograman Mobile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol untuk membuka Solusi Kuis (Soal 1-4)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KuisDesainPage()),
                  );
                },
                icon: const Icon(Icons.dashboard),
                label: const Text('Buka Dashboard Kuis UI/UX (Soal 1-4)'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(250, 50),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol untuk membuka Tugas Profil GitHub Anda
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GitHubProfileScreen()),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Buka Tugas Profil GitHub'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.black26),
                  minimumSize: const Size(250, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}