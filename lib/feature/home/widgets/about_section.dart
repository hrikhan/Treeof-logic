import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/responsive_builder.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const List<String> _whatIDo = [
    'Build responsive and interactive mobile applications',
    'Design clean UI/UX with a strong focus on performance',
    'Develop scalable app architectures using best practices',
    'RESTful API calls',
    'Integrate Firebase and local databases for real-time data and persistence',
  ];

  static const List<String> _currentFocus = [
    'Advanced state management',
    'App architecture and design patterns',
    'Performance optimization for large-scale apps',
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
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _InfoCard(
                              title: 'Current Focus',
                              subtitle:
                                  'Deepening Flutter expertise and modern practices.',
                              items: _currentFocus,
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
                          ),
                          const SizedBox(height: 16),
                          _InfoCard(
                            title: 'Current Focus',
                            subtitle:
                                'Deepening Flutter expertise and modern practices.',
                            items: _currentFocus,
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
  });

  final String title;
  final String subtitle;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
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
                        const Icon(
                          Icons.check_circle,
                          size: 18,
                          color: AppColors.primary,
                        ),
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
