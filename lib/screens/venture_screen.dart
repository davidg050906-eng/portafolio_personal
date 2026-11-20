import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class VentureScreen extends StatelessWidget {
  const VentureScreen({super.key});

  Future<void> _launchUrl(BuildContext context, String rawUrl) async {
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
        title: 'Emprendimiento',
        showContactButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.cardDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.accentCyan.withValues(alpha: 0.45),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.accentCyan.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.storefront_rounded,
                          color: AppTheme.accentCyan,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Livetech.ve',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            Text(
                              'Fundador & Director · Isla de Margarita',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppTheme.accentCyan,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tienda digital y comercio electrónico especializado en accesorios para iPhone, dispositivos de audio y tecnología de consumo en Nueva Esparta. Gestiono la importación directa, catálogo digital, ventas omnicanal y desarrollo de herramientas web para automatizar la experiencia de compra.',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TagChip(label: 'E-Commerce'),
                      _TagChip(label: 'Accesorios Apple & Audio'),
                      _TagChip(label: 'Logística & Importación'),
                      _TagChip(label: 'Automatización Web'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Canales oficiales de Livetech',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            _VentureLinkCard(
              icon: Icons.language_rounded,
              title: 'Tienda Online Oficial',
              subtitle: 'livetech-market.lovable.app',
              onTap: () =>
                  _launchUrl(context, 'https://livetech-market.lovable.app'),
            ),
            const SizedBox(height: 10),
            _VentureLinkCard(
              icon: Icons.camera_alt_outlined,
              title: 'Instagram Comercial',
              subtitle: '@livetech.ve',
              onTap: () =>
                  _launchUrl(context, 'https://instagram.com/livetech.ve'),
            ),
            const SizedBox(height: 10),
            _VentureLinkCard(
              icon: Icons.chat_bubble_outline_rounded,
              title: 'WhatsApp Business',
              subtitle: '+58 424-8261957',
              onTap: () => _launchUrl(
                context,
                'https://wa.me/584248261957?text=Hola%20David,%20vengo%20desde%20tu%20portafolio',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.primaryDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.accentCyan.withValues(alpha: 0.35),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _VentureLinkCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _VentureLinkCard({
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
          Icons.open_in_new_rounded,
          size: 18,
          color: AppTheme.accentCyan,
        ),
        onTap: onTap,
      ),
    );
  }
}