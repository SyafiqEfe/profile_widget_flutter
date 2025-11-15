// lib/widgets/student_card.dart (Bagian atas)

import 'package:flutter/material.dart';
import '../utils/feedback_utils.dart';

// Data Dummy untuk Soal 2: Profil Mahasiswa
final Map<String, String> studentProfile = const {
  'name': 'Syafiq Efendi Widyarachman',
  'nim': '231080200090',
  'prodi': 'Teknik Informatika',
  'angkatan': '2023',
  'status': 'Aktif',
  'imagePath': 'assets/images/student_syafiq.jpg', // Ganti dengan file Anda
  'university_code': 'UMSIDA' // Kode kampus
};

// lib/widgets/student_card.dart (Lanjutan)

class StudentCard extends StatelessWidget {
  const StudentCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna untuk header kartu (Bisa disesuaikan dengan warna kampus)
    final Color primaryColor = Colors.indigo[700]!; 

    return Card(
      color: Colors.white, 
      elevation: 4, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell( 
        onTap: () => showInteractionFeedback(context, 'Membuka Detail Profil Kampus'),
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // --- Header Kartu (Warna Kampus) ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'KARTU MAHASISWA (${studentProfile['university_code']!})',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const Icon(Icons.school, color: Colors.white, size: 20),
                ],
              ),
            ),

            // --- Bagian Detail Foto & Data ---
            Padding(
              padding: const EdgeInsets.all(20.0), 
              child: Row(
                children: <Widget>[
                  // Foto Profil (CircleAvatar dengan Gambar)
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage(studentProfile['imagePath']!),
                    onBackgroundImageError: (exception, stackTrace) {
                      return; // Handle error jika gambar tidak ada
                    },
                    child: studentProfile['imagePath'] == null ? const Icon(Icons.person, color: Colors.white, size: 40) : null,
                  ),
                  const SizedBox(width: 20),
                  
                  // Detail Informasi
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // NIM & Nama
                        Text(studentProfile['nim']!,
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(
                          studentProfile['name']!,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Program Studi & Angkatan
                        Text('${studentProfile['prodi']!} | Angkatan ${studentProfile['angkatan']!}',
                            style: const TextStyle(color: Colors.black54, fontSize: 13)),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // --- Footer Status dan Tombol Aksi ---
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Status Aktif
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'STATUS: ${studentProfile['status']!}',
                      style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),

                  // Tombol Aksi
                  ElevatedButton(
                    onPressed: () => showInteractionFeedback(context, 'Kartu ID dibuka di layar penuh'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: const Text('Lihat ID', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}