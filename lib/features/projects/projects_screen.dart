import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/custom_app_bar.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/side_navigation_drawer.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/footer.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Projects'),
      drawer: const SideNavigationDrawer(),
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
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            _AnimatedProjectCard(
              title: 'Flutter Portfolio',
              description:
                  'A professional portfolio built using Flutter with Firebase backend integration, responsive layout, and GetX state management.',
            ),
            _AnimatedProjectCard(
              title: 'Cross-platform App Development',
              description:
                  'Applications developed for SQME, Rooche, and GoodTech using Flutter for Android and iOS.',
            ),
            _AnimatedProjectCard(
              title: 'API Tester & Integrator',
              description:
                  'Designed and tested REST APIs, ensuring full coverage and stability for mobile applications.',
            ),
            _AnimatedProjectCard(
              title: 'Good Bank Mobile App',
              description:
                  'A secure and responsive mobile banking solution with modern UI and custom animations.',
            ),
            _AnimatedProjectCard(
              title: 'One Customer Portal',
              description:
                  'Enterprise-level portal enabling real-time user management and analytics.',
            ),
            _AnimatedProjectCard(
              title: 'PickApps Mobile App',
              description:
                  'On-demand service platform with location tracking and in-app messaging.',
            ),
            _AnimatedLinkCard(
              title: 'View Full Portfolio',
              description:
                  'Click here to see my full portfolio and latest works.',
              url:
                  'https://boedelacruz01.github.io/Ronald_dela_cruz_portfolio_v2/',
            ),
            SizedBox(height: 32),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}

class _AnimatedProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const _AnimatedProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
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
      child: ProjectCard(title: title, description: description),
    );
  }
}

class _AnimatedLinkCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const _AnimatedLinkCard({
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
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
      child: GestureDetector(
        onTap: () =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: ProjectCard(title: title, description: description),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      color: isDark ? Colors.black54 : Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
