import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              'Programming Languages & Frameworks',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Dart & Flutter\n'
              '• JavaScript (JS), Node.js\n'
              '• C Language\n'
              '• HTML5 & CSS3',
            ),
            const SizedBox(height: 24),

            Text(
              'API & Backend Tools',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• RESTful API Development\n'
              '• API Testing & Integration\n'
              '• Firebase, SQLite',
            ),
            const SizedBox(height: 24),

            Text(
              'Development Tools',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• VS Code, Android Studio, Git\n'
              '• Postman, Figma\n'
              '• Windows, Linux (basic)',
            ),
            const SizedBox(height: 24),

            Text(
              'Hardware & Technical Support',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Computer repair, setup, and troubleshooting\n'
              '• Printer, network, and OS support\n'
              '• Dell / HP hardware support',
            ),
            const SizedBox(height: 24),

            Text(
              'Design, Layout & Engineering',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Electrical layout and architectural design\n'
              '• Floor planning and space mapping',
            ),
            const SizedBox(height: 24),

            Text(
              'Soft Skills',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Fast learner & adaptable\n'
              '• Logical thinker & problem solver\n'
              '• Strong communication & teamwork',
            ),
          ],
        ),
      ),
    );
  }
}
