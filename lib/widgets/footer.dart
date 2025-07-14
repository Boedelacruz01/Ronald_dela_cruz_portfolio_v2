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

    // Detect dark background
    final isDarkBackground =
        theme.brightness == Brightness.dark ||
        theme.scaffoldBackgroundColor.computeLuminance() < 0.5;

    final textColor = isDarkBackground ? Colors.white70 : Colors.grey[800];
    final linkColor = isDarkBackground ? Colors.white : Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
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
                color: linkColor,
              ),
              _socialLink(
                icon: Icons.code,
                label: 'GitHub',
                url: 'https://github.com/boedelacruz01',
                color: linkColor,
              ),
              _socialLink(
                icon: Icons.mail_outline,
                label: 'Email',
                url: 'mailto:boedelacruz@gmail.com',
                color: linkColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '© $year Ronald Artuz Dela Cruz',
            style: theme.textTheme.bodySmall?.copyWith(
              color: textColor,
              fontSize: 13,
            ),
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
    required Color color,
  }) {
    return _HoverTextButton(
      onPressed: () => _launchUrl(url),
      icon: icon,
      label: label,
      color: color,
    );
  }
}

class _HoverTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color color;

  const _HoverTextButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  State<_HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<_HoverTextButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final Color hoverColor = Colors.amberAccent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: TextButton.icon(
          onPressed: widget.onPressed,
          icon: Icon(widget.icon, color: _hovering ? hoverColor : widget.color),
          label: Text(
            widget.label,
            style: TextStyle(
              color: _hovering ? hoverColor : widget.color,
              fontWeight: _hovering ? FontWeight.w600 : FontWeight.normal,
              decoration: _hovering
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
