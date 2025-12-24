import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/hover.dart';
import '../../../core/widgets/responsive_builder.dart';
import '../controller/home_controller.dart';
import 'tech_stack_chips.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final isMobile = sizingInfo.isMobile;
        final isTablet = sizingInfo.isTablet;
        final titleSize = isMobile
            ? 36.0
            : isTablet
            ? 48.0
            : 60.0;

        final content = _HeroContent(
          titleSize: titleSize,
          isMobile: isMobile,
          onPrimaryTap: () =>
              controller.scrollToSection(controller.projectsKey, offset: 72),
        );

        final visual = _HeroVisual(
          alignment: sizingInfo.isDesktop
              ? Alignment.centerRight
              : Alignment.center,
          showCodeOverlay: true,
          isMobile: isMobile,
        );

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: sizingInfo.isDesktop ? 80 : 48,
          ),
          child: sizingInfo.isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: content),
                    const SizedBox(width: 80),
                    Expanded(child: visual),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [visual, const SizedBox(height: 32), content],
                ),
        );
      },
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({
    required this.titleSize,
    required this.isMobile,
    required this.onPrimaryTap,
  });

  final double titleSize;
  final bool isMobile;
  final VoidCallback onPrimaryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 32, height: 2, color: AppColors.primary),
            const SizedBox(width: 8),
            const Text(
              "HELLO, I'M HRIDOY",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.4,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Semantics(
          header: true,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: titleSize,
                fontWeight: FontWeight.w900,
                height: 1.1,
                letterSpacing: -0.6,
                color: AppColors.textPrimary,
              ),
              children: const [
                TextSpan(text: 'Junior '),
                TextSpan(
                  text: 'Flutter',
                  style: TextStyle(color: AppColors.primary),
                ),
                TextSpan(text: ' Developer'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Text(
            'I craft pixel-perfect, high-performance applications from a single codebase. '
            'Turning complex problems into elegant cross-platform experiences for mobile, '
            'web, and desktop.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.6,
              color: AppColors.textMuted,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _PrimaryButton(
              icon: Icons.visibility,
              label: 'View My Work',
              onTap: onPrimaryTap,
            ),
            const _OutlineButton(
              icon: Icons.download,
              label: 'Download Resume',
            ),
          ],
        ),
        const SizedBox(height: 28),
        const Text(
          'TECH STACK',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 12),
        const TechStackChips(),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, isHovered) {
        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: isHovered ? const Color(0xFF0F6ED4) : AppColors.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            transform: Matrix4.translationValues(0, isHovered ? -2 : 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: isHovered ? AppColors.primary : AppColors.borderLight,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isHovered ? AppColors.primary : AppColors.textPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isHovered ? AppColors.primary : AppColors.textPrimary,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual({
    required this.alignment,
    required this.showCodeOverlay,
    required this.isMobile,
  });

  final Alignment alignment;
  final bool showCodeOverlay;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final visualSize = maxWidth > 520 ? 520.0 : maxWidth;
          return SizedBox(
            width: visualSize,
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  const Positioned.fill(child: _HeroGlow()),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 32,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                'https://res.cloudinary.com/dofsibxao/image/upload/v1766552671/2025-12-24_10.59.56_jksifr.jpg',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.medium,
                              ),
                            ),
                            if (showCodeOverlay)
                              Positioned(
                                top: 10,
                                right: 24,

                                // bottom: 24,
                                child: _CodeOverlay(
                                  backgroundOpacity: isMobile ? 0.7 : 0.9,
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
        },
      ),
    );
  }
}

class _HeroGlow extends StatelessWidget {
  const _HeroGlow();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 1.2,
        heightFactor: 1.2,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CodeOverlay extends StatelessWidget {
  const _CodeOverlay({required this.backgroundOpacity});

  final double backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(backgroundOpacity),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF38424F)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              _Dot(color: Color(0xFFEF4444)),
              SizedBox(width: 6),
              _Dot(color: Color(0xFFFACC15)),
              SizedBox(width: 6),
              _Dot(color: Color(0xFF22C55E)),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
                fontFamily: 'monospace',
                color: Color(0xFFCBD5E1),
              ),
              children: const [
                TextSpan(
                  text: 'class ',
                  style: TextStyle(color: Color(0xFFC792EA)),
                ),
                TextSpan(
                  text: 'MyApp ',
                  style: TextStyle(color: Color(0xFFFFCB6B)),
                ),
                TextSpan(
                  text: 'extends ',
                  style: TextStyle(color: Color(0xFFC792EA)),
                ),
                TextSpan(
                  text: 'StatelessWidget',
                  style: TextStyle(color: Color(0xFFFFCB6B)),
                ),
                TextSpan(text: ' {\n'),
                TextSpan(
                  text: '  @override\n',
                  style: TextStyle(color: Color(0xFFC792EA)),
                ),
                TextSpan(
                  text: '  Widget ',
                  style: TextStyle(color: Color(0xFFFFCB6B)),
                ),
                TextSpan(
                  text: 'build',
                  style: TextStyle(color: Color(0xFF82AAFF)),
                ),
                TextSpan(text: '() {\n'),
                TextSpan(
                  text: '    return ',
                  style: TextStyle(color: Color(0xFFC792EA)),
                ),
                TextSpan(
                  text: 'Container',
                  style: TextStyle(color: Color(0xFFFFCB6B)),
                ),
                TextSpan(text: '(\n'),
                TextSpan(
                  text: '      child: ',
                  style: TextStyle(color: Color(0xFF82AAFF)),
                ),
                TextSpan(
                  text: '"Success"',
                  style: TextStyle(color: Color(0xFFC3E88D)),
                ),
                TextSpan(text: ',\n'),
                TextSpan(text: '    );\n'),
                TextSpan(text: '  }\n'),
                TextSpan(text: '}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
