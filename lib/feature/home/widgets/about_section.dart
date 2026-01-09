import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/responsive_builder.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const List<String> _whatIDo = [
    'Architect human-centered Flutter apps that feel native across mobile, web, and desktop.',
    'Implement clean UI systems powered by GetX for state, navigation, and dependency control.',
    'Wire RESTful APIs, Firebase, and data layers so features scale while staying performant.',
  ];

  static const List<String> _currentFocus = [
    'Building AI-driven assistants and automation flows inside client dashboards.',
    'Modernizing onboarding analytics with live telemetry and responsive dashboards.',
    'Sharpening design/code cohesion for smoother handoffs and maintainable codebases.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderLight)),
      ),
      child: Semantics(
        header: true,
        child: ResponsiveBuilder(
          builder: (context, sizingInfo) {
            final isDesktop = sizingInfo.isDesktop;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "I'm a passionate Flutter Developer with 2 years of hands-on experience "
                  'building scalable, user-friendly mobile applications. I specialize in '
                  'crafting high-performance apps using Flutter, delivering seamless '
                  'experiences across Android, iOS, web, and desktop from a single codebase.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'I enjoy transforming complex ideas into clean, intuitive interfaces and '
                  'continuously learning modern development practices to improve performance, '
                  'usability, and maintainability.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 24),
                isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _InfoCard(
                              title: 'What I Do',
                              subtitle: 'Core services and delivery focus.',
                              items: _whatIDo,
                              accentColor: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _InfoCard(
                              title: 'Current Focus',
                              subtitle:
                                  'Deepening Flutter expertise and modern practices.',
                              items: _currentFocus,
                              accentColor: AppColors.primaryHover,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _InfoCard(
                            title: 'What I Do',
                            subtitle: 'Core services and delivery focus.',
                            items: _whatIDo,
                            accentColor: AppColors.primary,
                          ),
                          const SizedBox(height: 16),
                          _InfoCard(
                            title: 'Current Focus',
                            subtitle:
                                'Deepening Flutter expertise and modern practices.',
                            items: _currentFocus,
                            accentColor: AppColors.primaryHover,
                          ),
                        ],
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.items,
    required this.accentColor,
  });

  final String title;
  final String subtitle;
  final List<String> items;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accentColor.withOpacity(0.18), Colors.white],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.15),
            blurRadius: 22,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.insights, color: accentColor, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, size: 18, color: accentColor),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
