import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/custom_app_bar.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/footer.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/side_navigation_drawer.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/section_title.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/wrapper.dart';
import 'package:ronald_dela_cruz_portfolio_v2/widgets/gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _launchResume() async {
    final url =
        'https://raw.githubusercontent.com/Boedelacruz01/portfolio-Assets/main/RONALD_RESUME_2025_NP_v2.pdf';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('⚠️ Could not launch resume URL');
      Get.snackbar(
        'Download Failed',
        'Could not launch resume link.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      drawer: const SideNavigationDrawer(),
      body: ResponsiveLayout(
        mobile: _buildBody(theme),
        tablet: _buildBody(theme),
        desktop: _buildBody(theme),
      ),
    );
  }

  Widget _buildBody(ThemeData theme) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D3B3E), // Dark Teal-Green
            Color(0xFF1B5E20), // Deep Green
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profilepic.jpg'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ronald Artuz Dela Cruz',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter Developer • WEB Developer • Tech Support',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 24),

                // 👇 SectionTitle - no `const`, animated
                SectionTitle(
                  title: 'Welcome to my professional portfolio.',
                  subtitle: 'Browse to learn more about me.',
                ),

                const SizedBox(height: 32),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    GradientButton(
                      onPressed: () => Get.toNamed('/about'),
                      icon: const Icon(Icons.person, color: Colors.white),
                      label: 'About Me',
                    ),
                    GradientButton(
                      onPressed: () => Get.toNamed('/skills'),
                      icon: const Icon(Icons.code, color: Colors.white),
                      label: 'Skills',
                    ),
                    GradientButton(
                      onPressed: () => Get.toNamed('/experience'),
                      icon: const Icon(Icons.work, color: Colors.white),
                      label: 'Experience',
                    ),
                    GradientButton(
                      onPressed: () => Get.toNamed('/projects'),
                      icon: const Icon(
                        Icons.mobile_friendly,
                        color: Colors.white,
                      ),
                      label: 'Projects',
                    ),
                    GradientButton(
                      onPressed: () => Get.toNamed('/contact'),
                      icon: const Icon(Icons.mail, color: Colors.white),
                      label: 'Contact',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                OutlinedButton.icon(
                  onPressed: _launchResume,
                  icon: const Icon(Icons.file_download, color: Colors.white),
                  label: const Text("Download Resume"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
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
}
