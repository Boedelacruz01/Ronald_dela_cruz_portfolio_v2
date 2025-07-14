import 'package:get/get.dart';
import '../features/home/home_screen.dart';
import '../features/about/about_screen.dart';
import '../features/experience/experience_screen.dart';
import '../features/projects/projects_screen.dart';
import '../features/resume/resume_screen.dart';
import '../features/contact/contact_screen.dart';
import '../features/skills/skills_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: '/about',
      page: () => const AboutScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: '/experience',
      page: () => const ExperienceScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: '/projects',
      page: () => const ProjectsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: '/resume',
      page: () => const ResumeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: '/contact',
      page: () => const ContactScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: '/skills',
      page: () => const SkillsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
