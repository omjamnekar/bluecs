import 'package:bluecs/core/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerSection extends ConsumerWidget {
  const DrawerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(themeProvider.notifier);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text('Menu'),
          ),
          ListTile(title: Text('Home')),
          ListTile(
            onTap: () => toggle.toggleTheme(!toggle.isDark),
            title: Text('theme'),
            trailing: Icon(toggle.isDark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          ),
          ListTile(title: Text('Profile')),
        ],
      ),
    );
  }
}
