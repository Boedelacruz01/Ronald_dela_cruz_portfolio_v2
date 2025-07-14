import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('About Me')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              'Career Objective',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'To secure a responsible position with a progressive firm that will utilize my skills and experience and provide growth opportunities in my field of specialization.',
            ),
            const SizedBox(height: 24),

            Text(
              'Skills',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Flutter, Dart, C, JS, Node.js, HTML, CSS\n'
              '• API Development & Testing\n'
              '• Computer Repair & Troubleshooting\n'
              '• Electrical/Architectural Layout & Floor Planning\n'
              '• Driver/Mechanic – Troubleshooting Vehicle Issues',
            ),
            const SizedBox(height: 24),

            Text(
              'Education',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• AMA CLC – Computer Programming (1998–2000)\n'
              '• Noveleta National High School (1993–1998)',
            ),
            const SizedBox(height: 24),

            Text(
              'Certifications',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Philippine Coding Camp – Advanced Programming\n'
              '• Japan School of Advanced Technology – Call Center Training (100 hrs)\n'
              '• Dell Solution Station – Hardware/Software Training\n'
              '• HP Laptop Support – XP/Vista/7/8/10',
            ),
            const SizedBox(height: 24),

            Text(
              'Background & Interests',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Reading, chanting the Maha Mantra, meditating, solving puzzles, playing instruments, and sport shooting.\n'
              'I’m passionate about learning, troubleshooting tech and vehicles, and exploring the universe through logic and curiosity.',
            ),
          ],
        ),
      ),
    );
  }
}
