import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_models.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const List<ContactOption> _options = [
    ContactOption(
      label: 'WhatsApp',
      value: '+58 424-8261957',
      url: 'https://wa.me/584248261957',
      icon: Icons.chat_bubble_outline_rounded,
    ),
    ContactOption(
      label: 'Correo electrónico',
      value: 'davidg.050906@gmail.com',
      url: 'mailto:davidg.050906@gmail.com?subject=Portafolio%20Flutter',
      icon: Icons.email_outlined,
    ),
    ContactOption(
      label: 'GitHub',
      value: 'github.com/davidg050906-eng',
      url: 'https://github.com/davidg050906-eng',
      icon: Icons.code_rounded,
    ),
    ContactOption(
      label: 'Instagram Livetech',
      value: '@livetech.ve',
      url: 'https://instagram.com/livetech.ve',
      icon: Icons.storefront_rounded,
    ),
  ];

  Future<void> _openLink(BuildContext context, String rawUrl) async {
    final uri = Uri.parse(rawUrl);
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir el enlace en este dispositivo.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Contacto',
        showContactButton: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _options.length + 1,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Text(
              'Canales directos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            );
          }
          final item = _options[index - 1];
          return Card(
            color: AppTheme.cardDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                color: AppTheme.accentCyan.withValues(alpha: 0.25),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: AppTheme.accentCyan.withValues(alpha: 0.15),
                child: Icon(item.icon, color: AppTheme.accentCyan),
              ),
              title: Text(
                item.label,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                item.value,
                style: const TextStyle(color: AppTheme.textSecondary),
              ),
              trailing: const Icon(
                Icons.open_in_new_rounded,
                color: AppTheme.accentCyan,
              ),
              onTap: () => _openLink(context, item.url),
            ),
          );
        },
      ),
    );
  }
}