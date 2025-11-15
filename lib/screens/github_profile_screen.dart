// lib/screens/github_profile_screen.dart

import 'package:flutter/material.dart';
import '../widgets/info_item.dart';
import '../utils/feedback_utils.dart';

class GitHubProfileScreen extends StatelessWidget {
  const GitHubProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Profile'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Foto Profil
                CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage('assets/profile.jpg'), 
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 15),

                // Nama dan Username
                const Text(
                  'Syafiq Efendi',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(height: 5),
                const Text(
                  '@syafiqefendi',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),

                // Bio
                const Text(
                  'Flutter Developer | Tech Enthusiast | Open Source Contributor',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 20),

                // Row Tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () =>
                          showInteractionFeedback(context, 'Followed Syafiq ✅'),
                      icon: const Icon(Icons.person_add_alt),
                      label: const Text('Follow'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () =>
                          showInteractionFeedback(context, 'Message sent 💬'),
                      icon: const Icon(Icons.email_outlined),
                      label: const Text('Message'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Info (Followers, Following, Repos)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    InfoItem(label: 'Followers', value: '1.2k'), 
                    InfoItem(label: 'Following', value: '320'),
                    InfoItem(label: 'Repost', value: '48'),
                  ],
                ),
                const SizedBox(height: 20),

                // Bio tambahan / lokasi
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('Sidoarjo, Indonesia',
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.link, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('github.com/SyafiqEfe',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}