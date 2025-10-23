import 'package:flutter/material.dart';

void main() {
  runApp(GitHubProfile());
}

class GitHubProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Profile',
      debugShowCheckedModeBanner: false,
      home: GitHubProfilePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: 'Roboto',
      ),
    );
  }
}

class GitHubProfilePage extends StatelessWidget {
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Profile'),
        centerTitle: true,
        backgroundColor: Colors.black87,
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
                  backgroundImage: AssetImage('assets/profile.jpg'),
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
                          _showSnackBar(context, 'Followed Syafiq ✅'),
                      icon: const Icon(Icons.person_add_alt),
                      label: const Text('Follow'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () =>
                          _showSnackBar(context, 'Message sent 💬'),
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
                    _InfoItem(label: 'Followers', value: '1.2k'),
                    _InfoItem(label: 'Following', value: '320'),
                    _InfoItem(label: 'Repost', value: '48'),
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

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
