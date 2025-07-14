import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      child: Container(
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
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(context),
            const SizedBox(height: 12),
            _HoverNavTile(title: 'Home', icon: Icons.home, route: '/'),
            _HoverNavTile(
              title: 'About Me',
              icon: Icons.person,
              route: '/about',
            ),
            _HoverNavTile(title: 'Skills', icon: Icons.code, route: '/skills'),
            _HoverNavTile(
              title: 'Experience',
              icon: Icons.work,
              route: '/experience',
            ),
            _HoverNavTile(
              title: 'Projects',
              icon: Icons.mobile_friendly,
              route: '/projects',
            ),
            _HoverNavTile(
              title: 'Contact',
              icon: Icons.mail,
              route: '/contact',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    final theme = Theme.of(context);
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/profilepic.jpg'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ronald Dela Cruz',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Flutter Developer',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverNavTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final String route;

  const _HoverNavTile({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  State<_HoverNavTile> createState() => _HoverNavTileState();
}

class _HoverNavTileState extends State<_HoverNavTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentRoute = Get.currentRoute;
    final isActive = currentRoute == widget.route;
    final isDark = theme.brightness == Brightness.dark;
    final activeColor = isDark ? Colors.greenAccent : Colors.green[900];

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.back();
          if (!isActive) Get.toNamed(widget.route);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? activeColor!.withOpacity(0.15)
                : _hovering
                ? (isDark ? Colors.white10 : Colors.black12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: isActive
                    ? activeColor
                    : _hovering
                    ? theme.iconTheme.color?.withOpacity(0.9)
                    : theme.iconTheme.color,
              ),
              const SizedBox(width: 16),
              Text(
                widget.title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isActive
                      ? activeColor
                      : _hovering
                      ? (isDark ? Colors.white70 : Colors.black87)
                      : (isDark ? Colors.white60 : Colors.black87),
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
