import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/hover.dart';
import '../../../core/widgets/responsive_builder.dart';
import '../controller/home_controller.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.controller});

  static const double height = 72;

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final padding = sizingInfo.isMobile ? 16.0 : 40.0;
        return Semantics(
          label: 'Primary navigation',
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                height: height,
                padding: EdgeInsets.symmetric(horizontal: padding),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  border: const Border(
                    bottom: BorderSide(color: AppColors.borderLight),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.scrollToSection(
                        controller.homeKey,
                        offset: height,
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.flutter_dash,
                            color: AppColors.primary,
                            size: 32,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'TreeOfLogic',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    if (!sizingInfo.isMobile) ...[
                      _NavItem(
                        label: 'Home',
                        onTap: () => controller.scrollToSection(
                          controller.homeKey,
                          offset: height,
                        ),
                      ),
                      _NavItem(
                        label: 'Projects',
                        onTap: () => controller.scrollToSection(
                          controller.projectsKey,
                          offset: height,
                        ),
                      ),
                      _NavItem(
                        label: 'About',
                        onTap: () => controller.scrollToSection(
                          controller.aboutKey,
                          offset: height,
                        ),
                      ),
                      _NavItem(
                        label: 'Contact',
                        onTap: () => controller.scrollToSection(
                          controller.contactKey,
                          offset: height,
                        ),
                      ),
                      const SizedBox(width: 24),
                      _NavButton(
                        label: 'Hire Me',
                        onTap: () => controller.scrollToSection(
                          controller.contactKey,
                          offset: height,
                        ),
                      ),
                    ] else
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, isHovered) {
        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isHovered ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isHovered ? AppColors.primary : AppColors.textPrimary,
              ),
              child: Text(label),
            ),
          ),
        );
      },
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, isHovered) {
        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: isHovered ? const Color(0xFF0F6ED4) : AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
