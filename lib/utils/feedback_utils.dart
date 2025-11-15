// lib/utils/feedback_utils.dart

import 'package:flutter/material.dart';

// Fungsi untuk menampilkan SnackBar yang fleksibel (digunakan oleh kedua tugas)
void showInteractionFeedback(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.indigo, // Menggunakan warna tema utama
    ),
  );
}