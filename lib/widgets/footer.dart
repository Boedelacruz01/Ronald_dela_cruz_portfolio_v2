import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      if (kIsWeb && uri.scheme == 'mailto') {
        await launchUrl(uri, webOnlyWindowName: '_blank');
      } else {
        await launchUrl(
          uri,
          mode: uri.scheme == 'mailto'
              ? LaunchMode.platformDefault
              : LaunchMode.externalApplication,
        );
      }
    } else {
      debugPrint('⚠️ Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final year = DateTime.now().year;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              _socialLink(
                icon: Icons.linked_camera,
                label: 'LinkedIn',
                url: 'https://www.linkedin.com/in/ronald-dela-cruz-5b72a7319',
              ),
              _socialLink(
                icon: Icons.code,
                label: 'GitHub',
                url: 'https://github.com/boedelacruz01',
              ),
              _socialLink(
                icon: Icons.mail_outline,
                label: 'Email',
                url: 'mailto:boedelacruz@gmail.com',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '© $year Ronald Artuz Dela Cruz',
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _socialLink({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return TextButton.icon(
      onPressed: () => _launchUrl(url),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
