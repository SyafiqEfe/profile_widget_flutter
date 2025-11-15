// lib/widgets/contact_list.dart

import 'package:flutter/material.dart';
import '../utils/feedback_utils.dart';

// Data Dummy untuk Soal 3: Daftar Kontak
final List<Map<String, dynamic>> contacts = const [
  {'name': 'Ilham Arip', 'phone': '081234xxxx', 'status': 'Online', 'color': Colors.green},
  {'name': 'Wahyu Sang', 'phone': '087890xxxx', 'status': 'Away', 'color': Colors.amber},
  {'name': 'Syafiq.exe', 'phone': '089900xxxx', 'status': 'Offline', 'color': Colors.grey},
];

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: contacts.map((contact) {
          // ListTile di dalam Card (Soal 3)
          return Column( 
            children: [
              ListTile(
                // Avatar (ikon orang) + Status Indikator (Soal 3)
                leading: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: contact['color'] as Color, // Status warna mudah dibedakan (Soal 3 UX)
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                // Nama kontak (Soal 3)
                title: Text(contact['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                // Nomor telepon & Status (Soal 3)
                subtitle: Text('${contact['phone']} (${contact['status']})', style: const TextStyle(color: Colors.black54)), // Teks mudah dibaca (Soal 3 UX)
                // Tombol panggil (icon button) (Soal 3)
                trailing: IconButton(
                  icon: const Icon(Icons.call, color: Colors.green),
                  onPressed: () => showInteractionFeedback(context, 'Memanggil ${contact['name']}'), // Menggunakan fungsi utilitas
                ),
                onTap: () => showInteractionFeedback(context, 'Membuka chat dengan ${contact['name']}'),
              ),
              if (contact != contacts.last) const Divider(indent: 75), // Divider kecuali item terakhir
            ],
          );
        }).toList(),
      ),
    );
  }
}