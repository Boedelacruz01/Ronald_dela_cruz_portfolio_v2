import 'package:flutter/material.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/custom_app_bar.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/section_title.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/footer.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/side_navigation_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'About Me'),
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
          padding: const EdgeInsets.all(24.0),
          children: [
            _animatedFade(const SectionTitle(title: 'Career Objective')),
            const SizedBox(height: 8),
            _animatedFade(
              Text(
                'To secure a responsible position with a progressive firm that will utilize my skills and experience and provide growth opportunities in my field of specialization.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            _animatedFade(const SectionTitle(title: 'Skills')),
            const SizedBox(height: 8),
            _animatedFade(
              Text(
                '• Flutter, Dart, C, JS, Node.js, HTML, CSS\n'
                '• API Development & Testing\n'
                '• Computer Repair & Troubleshooting\n'
                '• Electrical/Architectural Layout & Floor Planning\n'
                '• Driver/Mechanic – Troubleshooting Vehicle Issues',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            _animatedFade(const SectionTitle(title: 'Education')),
            const SizedBox(height: 8),
            _animatedFade(
              Text(
                '• AMA CLC – Computer Programming (1998–2000)\n'
                '• Noveleta National High School (1993–1998)',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            _animatedFade(const SectionTitle(title: 'Certifications')),
            const SizedBox(height: 8),
            _animatedFade(
              Text(
                '• Philippine Coding Camp – Advanced Programming\n'
                '• Japan School of Advanced Technology – Call Center Training (100 hrs)\n'
                '• Dell Solution Station – Hardware/Software Training\n'
                '• HP Laptop Support – XP/Vista/7/8/10',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            _animatedFade(const SectionTitle(title: 'Background & Interests')),
            const SizedBox(height: 8),
            _animatedFade(
              Text(
                'Reading, chanting the Maha Mantra, meditating, solving puzzles, playing instruments, and sport shooting.\n'
                'I’m passionate about learning, troubleshooting tech and vehicles, and exploring the universe through logic and curiosity.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  /// Reusable fade + slide animation wrapper
  Widget _animatedFade(Widget child) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, (1 - value) * 20),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
