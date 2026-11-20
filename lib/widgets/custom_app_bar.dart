import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showContactButton;

  const CustomAppBar({
    super.key,
    this.title = '<David />',
    this.showContactButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.accentCyan,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
      actions: [
        if (showContactButton)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/contact'),
              icon: const Icon(Icons.send_rounded, size: 16, color: AppTheme.primaryDark,),
              label: const Text('Contacto', style: TextStyle(color: AppTheme.primaryDark,fontWeight: FontWeight.w600,),),
              style: TextButton.styleFrom(
                backgroundColor: AppTheme.accentCyan,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}