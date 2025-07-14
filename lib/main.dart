import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ronald_dela_cruz_portfolio_v2/routes/router.dart';
import 'core/app_state.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create and initialize AppState with persisted theme
  final appState = AppState();
  await appState.loadTheme(); // ✅ wait for theme preference to load

  runApp(
    ChangeNotifierProvider(
      create: (_) => appState,
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return GetMaterialApp(
      title: 'Ronald Dela Cruz Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: appState.themeMode, // ✅ uses loaded theme
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
