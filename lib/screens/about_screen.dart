import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<String> _skills = [
    'Flutter & Dart',
    'C# · Java · Python',
    'MySQL & Bases de Datos',
    'Git & GitHub',
    'E-Commerce · Livetech.ve',
  ];

  static const List<Recommendation> _recommendations = [
    Recommendation(
      author: 'Christian Villalba',
      role: 'Compañero de Ingeniería en Sistemas',
      comment:
          'Comprometido con la estructura del código, la resolución práctica de problemas y el trabajo constante en equipo.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sobre mí', showContactButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.cardDark,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppTheme.accentCyan.withValues(alpha: 0.25),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perfil profesional',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.accentCyan,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Soy estudiante de Ingeniería en Sistemas en UNIMAR y fundador de Livetech.ve en Isla de Margarita. Combino desarrollo de software, manejo de bases de datos y gestión operativa para crear soluciones claras y funcionales.',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Habilidades y enfoque',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _skills
                  .map(
                    (skill) => Chip(
                      backgroundColor: AppTheme.cardDark,
                      side: BorderSide(
                        color: AppTheme.accentCyan.withValues(alpha: 0.4),
                      ),
                      label: Text(
                        skill,
                        style: const TextStyle(color: AppTheme.textPrimary),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Recomendaciones',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            ..._recommendations.map(
              (rec) => Card(
                color: AppTheme.cardDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: AppTheme.accentCyan.withValues(alpha: 0.25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${rec.comment}"',
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontStyle: FontStyle.italic,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        rec.author,
                        style: const TextStyle(
                          color: AppTheme.accentCyan,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        rec.role,
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}