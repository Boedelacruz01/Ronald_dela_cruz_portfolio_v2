import 'package:flutter/material.dart';

/// App-wide constants used for layout, spacing, and styles.
class AppConstants {
  // Padding and Margins
  static const double horizontalPadding = 24.0;
  static const double verticalPadding = 16.0;
  static const double cardPadding = 12.0;
  static const double sectionSpacing = 32.0;

  // Breakpoints
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;

  // Colors
  static const Color primaryColor = Colors.indigo;
  static const Color secondaryColor = Colors.indigoAccent;
  static const Color lightBackground = Colors.white;
  static const Color darkBackground = Color(0xFF121212);

  // External links
  static const String github = 'https://github.com/boedelacruz01';
  static const String linkedin =
      'https://linkedin.com/in/ronald-dela-cruz-5b72a7319';
  static const String email = 'boedelacruz@gmail.com';

  // Asset Paths
  static const String profileImage = 'assets/placeholderImage.jpg';
  static const String resumePdfUrl =
      'https://your-firebase-storage-link.com/RONALD_RESUME_2025_WP_v2.pdf'; // Update later
}
