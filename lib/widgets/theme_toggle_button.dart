import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isDark = appState.themeMode == ThemeMode.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _hovering
              ? (isDark ? Colors.white10 : Colors.black12)
              : Colors.transparent,
        ),
        child: IconButton(
          tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                RotationTransition(turns: animation, child: child),
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey<bool>(isDark),
              color: isDark ? Colors.amberAccent : Colors.blueGrey[900],
              size: 24,
            ),
          ),
          onPressed: () => appState.toggleTheme(),
        ),
      ),
    );
  }
}
