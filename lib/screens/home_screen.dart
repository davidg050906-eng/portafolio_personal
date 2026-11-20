import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/profile_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '<David />', showContactButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeader(
              fullName: 'David Alejandro González Cárdenas',
              role: 'Ingeniería en Sistemas · Fundador de Livetech.ve',
              tagline:
                  'Desarrollo de soluciones de software, comercio digital y tecnología aplicada en Isla de Margarita.',
            ),
            const SizedBox(height: 28),
            const Text(
              'Explorar secciones',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              icon: Icons.storefront_rounded,
              title: 'Emprendimiento Principal · Livetech.ve',
              subtitle: 'E-commerce tecnológico, catálogo digital y operación comercial',
              onTap: () => Navigator.pushNamed(context, '/venture'),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              icon: Icons.person_outline_rounded,
              title: 'Sobre mí',
              subtitle: 'Formación en UNIMAR, stack técnico y recomendaciones',
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              icon: Icons.contact_mail_outlined,
              title: 'Contacto y enlaces',
              subtitle: 'WhatsApp directo, correo electrónico y GitHub',
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.cardDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: AppTheme.accentCyan.withValues(alpha: 0.25)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppTheme.accentCyan.withValues(alpha: 0.15),
          child: Icon(icon, color: AppTheme.accentCyan),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: AppTheme.accentCyan,
        ),
        onTap: onTap,
      ),
    );
  }
}