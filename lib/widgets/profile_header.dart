import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  final String fullName;
  final String role;
  final String tagline;

  const ProfileHeader({
    super.key,
    required this.fullName,
    required this.role,
    required this.tagline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.accentCyan, width: 3),
            boxShadow: [
              BoxShadow(
                color: AppTheme.accentCyan.withValues(alpha: 0.25),
                blurRadius: 18,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 62,
            backgroundColor: AppTheme.cardDark,
            backgroundImage: AssetImage('assets/images/profile.JPG'),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          fullName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.cardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppTheme.accentCyan.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.accentCyan,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          tagline,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}