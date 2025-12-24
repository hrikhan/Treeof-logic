import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/breakpoints.dart';
import '../../../core/widgets/responsive_builder.dart';
import '../controller/home_controller.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/stats_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInfo) {
              return SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: Navbar.height),
                    Padding(
                      padding: Breakpoints.pagePadding(sizingInfo.deviceType),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1400),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SectionAnchor(
                                anchorKey: controller.homeKey,
                                child: const HeroSection(),
                              ),
                              const SizedBox(height: 24),
                              SectionAnchor(
                                anchorKey: controller.statsKey,
                                child: const StatsSection(),
                              ),
                              const SizedBox(height: 32),
                              SectionAnchor(
                                anchorKey: controller.projectsKey,
                                child: const ProjectsSection(),
                              ),
                              const SizedBox(height: 32),
                              const ExperienceSection(),
                              const SizedBox(height: 32),
                              SectionAnchor(
                                anchorKey: controller.aboutKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    AboutSection(),
                                    SizedBox(height: 32),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              SectionAnchor(
                                anchorKey: controller.contactKey,
                                child: const ContactSection(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Navbar(controller: controller),
        ],
      ),
    );
  }
}

class SectionAnchor extends StatelessWidget {
  const SectionAnchor({required this.anchorKey, required this.child})
    : super(key: anchorKey);

  final GlobalKey anchorKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
