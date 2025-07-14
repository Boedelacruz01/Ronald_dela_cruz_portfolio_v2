import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'boedelacruz@gmail.com');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactTile(
              icon: Icons.phone,
              title: 'Mobile',
              subtitle: 'Globe: 09055935273\nSmart: 09304895819',
            ),
            const SizedBox(height: 12),
            ContactTile(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'boedelacruz@gmail.com',
              onTap: _launchEmail,
            ),
            const SizedBox(height: 12),
            ContactTile(
              icon: Icons.link,
              title: 'LinkedIn',
              subtitle: 'linkedin.com/in/ronald-dela-cruz-5b72a7319',
              onTap: () => _launchUrl(
                'https://www.linkedin.com/in/ronald-dela-cruz-5b72a7319',
              ),
            ),
            const SizedBox(height: 12),
            ContactTile(
              icon: Icons.code,
              title: 'GitHub',
              subtitle: 'github.com/boedelacruz01',
              onTap: () => _launchUrl('https://github.com/boedelacruz01'),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: _launchEmail,
                icon: const Icon(Icons.mail),
                label: const Text('Send Me an Email'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ContactTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(title, style: theme.textTheme.titleMedium),
      subtitle: Text(subtitle),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: theme.cardColor.withOpacity(0.05),
    );
  }
}
