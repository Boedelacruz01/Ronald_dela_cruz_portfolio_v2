import 'package:flutter/material.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/section_title.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/custom_app_bar.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/side_navigation_drawer.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/footer.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Skills'),
      drawer: const SideNavigationDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF0D3B3E), const Color(0xFF1B5E20)]
                : [const Color(0xFFA5D6A7), const Color(0xFF66BB6A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          children: [
            const SectionTitle(title: 'Programming Languages & Frameworks'),
            const SizedBox(height: 8),
            _styledText(
              '• Dart & Flutter\n'
              '• JavaScript (JS), Node.js\n'
              '• C Language\n'
              '• HTML5 & CSS3\n'
              '• PHP',
              theme,
              isDark,
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'API & Backend Tools'),
            const SizedBox(height: 8),
            _styledText(
              '• RESTful API Development\n'
              '• API Testing & Integration\n'
              '• Firebase, SQLite',
              theme,
              isDark,
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Development Tools'),
            const SizedBox(height: 8),
            _styledText(
              '• VS Code, Android Studio, Git\n'
              '• Postman, Figma\n'
              '• Windows, Linux (basic)',
              theme,
              isDark,
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Hardware & Technical Support'),
            const SizedBox(height: 8),
            _styledText(
              '• Computer repair, setup, and troubleshooting\n'
              '• Printer, network, and OS support\n'
              '• Dell / HP hardware support',
              theme,
              isDark,
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Design, Layout & Engineering'),
            const SizedBox(height: 8),
            _styledText(
              '• Electrical layout and architectural design\n'
              '• Floor planning and space mapping',
              theme,
              isDark,
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Soft Skills'),
            const SizedBox(height: 8),
            _styledText(
              '• Fast learner & adaptable\n'
              '• Logical thinker & problem solver\n'
              '• Strong communication & teamwork',
              theme,
              isDark,
            ),

            const SizedBox(height: 32),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _styledText(String text, ThemeData theme, bool isDark) {
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: isDark ? Colors.white70 : Colors.black87,
        height: 1.5,
      ),
    );
  }
}
