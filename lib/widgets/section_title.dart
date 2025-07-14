import 'package:flutter/material.dart';

class SectionTitle extends StatefulWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideIn = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Improve contrast detection for gradient backgrounds
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final isDarkBackground =
        theme.brightness == Brightness.dark ||
        backgroundColor.computeLuminance() < 0.5;

    final titleColor = isDarkBackground ? Colors.white : Colors.black87;
    final subtitleColor = isDarkBackground ? Colors.white70 : Colors.black54;

    return FadeTransition(
      opacity: _fadeIn,
      child: SlideTransition(
        position: _slideIn,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            if (widget.subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                widget.subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: subtitleColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
