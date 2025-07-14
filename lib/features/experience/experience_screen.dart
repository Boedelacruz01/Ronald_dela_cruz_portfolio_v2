import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            ExperienceCard(
              company: 'SQME Professional',
              period: 'Aug 2024 – May 2025',
              role: 'Flutter Developer / API Tester',
              bullets: [
                'Developed Android apps using Flutter',
                'Built and tested RESTful APIs',
                'Collaborated with QA and backend teams',
              ],
            ),
            ExperienceCard(
              company: 'GoodTech Information System Inc.',
              period: 'Mar 2023 – Aug 2024',
              role: 'iOS/Android Developer',
              bullets: [
                'Built advanced mobile apps using Flutter',
                'Led API integration and testing',
                'Performed debugging and performance tuning',
              ],
            ),
            ExperienceCard(
              company: 'Rooche Digital Company',
              period: 'Jul 2022 – Jul 2023',
              role: 'Senior Flutter Developer',
              bullets: [
                'Developed cross-platform apps in Flutter',
                'Collaborated with UI/UX designers and backend teams',
                'Implemented performance enhancements and critical bug fixes',
              ],
            ),
            ExperienceCard(
              company: 'Apps Service Corp. (SJDB)',
              period: 'May 2022 – Jul 2022',
              role: 'Junior Flutter Developer',
              bullets: [
                'Supported mobile app maintenance for Android/iOS',
                'Handled debugging and API support tasks',
              ],
            ),
            ExperienceCard(
              company: 'RMS Collect (iQor Dasma)',
              period: 'Sep 2020 – Jan 2022',
              role: 'Customer Service Representative (T-Mobile)',
              bullets: [
                'Handled billing inquiries and account updates',
                'Educated customers about services and plans',
              ],
            ),
            ExperienceCard(
              company: 'ADP (Alabang)',
              period: 'Oct 2019 – May 2020',
              role: 'Operations Analyst – US Payroll',
              bullets: [
                'Processed payroll requests and deductions',
                'Handled onboarding and account updates',
              ],
            ),
            ExperienceCard(
              company: 'IGT Solutions',
              period: 'May 2018 – Oct 2019',
              role: 'Travel Consultant – Kiwi.com',
              bullets: [
                'Updated itineraries and documentation',
                'Handled booking changes and support',
              ],
            ),
            ExperienceCard(
              company: 'Schneider Electric (APC)',
              period: 'Jan 2016 – Nov 2017',
              role: 'Primary Technical Support Engineer',
              bullets: [
                'Resolved technical issues on equipment',
                'Interpreted CAD and engineering documents',
                'Recommended parts and processed orders',
              ],
            ),
            ExperienceCard(
              company: 'IQOR Phil. (Dasma)',
              period: 'Jul 2014 – Feb 2015',
              role: 'Customer Relation – Direct TV',
              bullets: [
                'Resolved billing and account inquiries',
                'Performed upselling and documentation',
              ],
            ),
            ExperienceCard(
              company: 'Alorica Pacific Rim Inc. (Makati)',
              period: 'May 2011 – May 2013',
              role: 'Tech Support / Quality Analyst / Reports Analyst',
              bullets: [
                'Resolved connectivity issues (Verizon, AT&T)',
                'Handled reporting and login troubleshooting',
              ],
            ),
            ExperienceCard(
              company: 'Teleperformance (Dell MOA)',
              period: 'Oct 2009 – Mar 2010',
              role: 'Tech Support – Dell On Call / Symantec',
              bullets: [
                'Resolved hardware/software issues',
                'Upsold products and maintained customer satisfaction',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company;
  final String period;
  final String role;
  final List<String> bullets;

  const ExperienceCard({
    super.key,
    required this.company,
    required this.period,
    required this.role,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(period, style: theme.textTheme.bodySmall),
            const SizedBox(height: 8),
            Text(role, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            ...bullets.map(
              (b) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(child: Text(b)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
