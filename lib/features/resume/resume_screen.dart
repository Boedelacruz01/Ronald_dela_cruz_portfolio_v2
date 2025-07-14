import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  Future<void> _downloadResume() async {
    final url =
        'https://your-url.com/RONALD_RESUME_2025_WP_v2.pdf'; // Replace with Firebase URL
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume')),
      body: Center(
        child: ElevatedButton(
          onPressed: _downloadResume,
          child: const Text('Download My Resume'),
        ),
      ),
    );
  }
}
