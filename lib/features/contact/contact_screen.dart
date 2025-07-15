import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/custom_app_bar.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/footer.dart';

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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Contact'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF0D3B3E), const Color(0xFF1B5E20)]
                : [const Color(0xFFA5D6A7), const Color(0xFF66BB6A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _animatedTile(
                  ContactTile(
                    icon: Icons.phone,
                    title: 'Mobile',
                    subtitle: 'Globe: 09055935273\nSmart: 09304895819',
                  ),
                ),
                const SizedBox(height: 12),
                _animatedTile(
                  ContactTile(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: 'boedelacruz@gmail.com',
                  ),
                ),
                const SizedBox(height: 12),
                _animatedTile(
                  ContactTile(
                    icon: Icons.link,
                    title: 'LinkedIn',
                    subtitle: 'linkedin.com/in/ronald-dela-cruz-5b72a7319',
                    onTap: () => _launchUrl(
                      'https://www.linkedin.com/in/ronald-dela-cruz-5b72a7319',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _animatedTile(
                  ContactTile(
                    icon: Icons.code,
                    title: 'GitHub',
                    subtitle: 'github.com/boedelacruz01',
                    onTap: () => _launchUrl('https://github.com/boedelacruz01'),
                  ),
                ),
                const SizedBox(height: 12),
                _animatedTile(
                  ContactTile(
                    icon: Icons.web,
                    title: 'Portfolio',
                    subtitle: 'boedelacruz01.github.io',
                    onTap: () => _launchUrl(
                      'https://boedelacruz01.github.io/Ronald_dela_cruz_portfolio_v2/',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 600),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, child) => Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: _launchEmail,
                    icon: const Icon(Icons.mail, color: Colors.white),
                    label: const Text('Send Me an Email'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark
                          ? const Color(0xFF1B5E20)
                          : const Color(0xFF66BB6A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedTile(Widget child) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.easeInOut,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: child,
        ),
      ),
      child: child,
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
    final isDark = theme.brightness == Brightness.dark;

    return ListTile(
      leading: Icon(icon, color: isDark ? Colors.white : theme.primaryColor),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: isDark
          ? Colors.white.withOpacity(0.05)
          : Colors.black.withOpacity(0.04),
    );
  }
}
