import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  static const List<_StatItemData> _stats = [
    _StatItemData(
      icon: Icons.schedule,
      value: '5+',
      label: 'Years Experience',
    ),
    _StatItemData(
      icon: Icons.rocket_launch,
      value: '20+',
      label: 'Projects Shipped',
    ),
    _StatItemData(
      icon: Icons.groups,
      value: '15+',
      label: 'Happy Clients',
    ),
    _StatItemData(
      icon: Icons.code,
      value: '100k+',
      label: 'Lines of Code',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Wrap(
        spacing: 48,
        runSpacing: 24,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: _stats
            .map((item) => _StatItem(
                  data: item,
                ))
            .toList(),
      ),
    );
  }
}

class _StatItemData {
  const _StatItemData({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.data});

  final _StatItemData data;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: data.label,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(data.icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.value,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                data.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
