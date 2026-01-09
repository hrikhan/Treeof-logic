import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/link.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/hover.dart';
import '../../../core/widgets/responsive_builder.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<ProjectItem> _projects = [
    ProjectItem(
      title: 'Billedsmart',
      subtitle: 'Smart bill negotiation',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Billing',
      imageUrl:
          'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/billedsmart',
      accent: AppColors.primary,
    ),
    ProjectItem(
      title: 'DeepQuran',
      subtitle: 'Quran learning app',
      techStack: ['Flutter', 'GetX', 'AI'],
      tag: 'Education',
      imageUrl:
          'https://images.unsplash.com/photo-1487014679447-9f8336841d58?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/deepquran',
      accent: AppColors.primaryHover,
    ),
    ProjectItem(
      title: 'Hamdann Ecommerce',
      subtitle: 'E-commerce experience',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Marketplace',
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/hamdann-ecommerce',
      accent: AppColors.borderDark,
    ),
    ProjectItem(
      title: 'Heartbeat Measure',
      subtitle: 'Student wellness',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/heartbeat-measure',
      accent: AppColors.primary,
    ),
    ProjectItem(
      title: 'Docmnk',
      subtitle: 'Hospital management',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Hospital',
      imageUrl:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/docmnk',
      accent: AppColors.primaryHover,
    ),
    ProjectItem(
      title: 'Doctor AI',
      subtitle: 'AI doctor training',
      techStack: ['Flutter', 'GetX', 'AI'],
      tag: 'AI',
      imageUrl:
          'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/doctor-ai',
      accent: AppColors.borderDark,
    ),
    ProjectItem(
      title: 'Prajanti Ecommerce',
      subtitle: 'B2B commerce',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Commerce',
      imageUrl:
          'https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/prajanti-ecommerce',
      accent: AppColors.primary,
    ),
    ProjectItem(
      title: 'School Point',
      subtitle: 'Event rewards',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Education',
      imageUrl:
          'https://images.unsplash.com/photo-1545239351-1141bd82e8a6?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/school-point',
      accent: AppColors.primaryHover,
    ),
    ProjectItem(
      title: 'Infix',
      subtitle: 'Learning management system',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'LMS',
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/infix-lms',
      accent: AppColors.borderDark,
    ),
    ProjectItem(
      title: 'Call YOU',
      subtitle: 'Video calling',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Video',
      imageUrl:
          'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/call-you',
      accent: AppColors.primary,
    ),
    ProjectItem(
      title: 'Kunduli Match',
      subtitle: 'Dating app',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Social',
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/kunduli-match',
      accent: AppColors.primaryHover,
    ),
    ProjectItem(
      title: 'Yopo',
      subtitle: 'Tenant app',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Property',
      imageUrl:
          'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/yopo',
      accent: AppColors.borderDark,
    ),
    ProjectItem(
      title: 'Task Management',
      subtitle: 'Team workflow',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Productivity',
      imageUrl:
          'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/task-management',
      accent: AppColors.primary,
    ),
    ProjectItem(
      title: 'Romain Institute School Bill',
      subtitle: 'School billing',
      techStack: ['Flutter', 'GetX', 'RESTful API'],
      tag: 'Education',
      imageUrl:
          'https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?auto=format&fit=crop&w=600&q=80',
      linkUrl: 'https://hridoysoft.com/projects/romain-institute-school-bill',
      accent: AppColors.primaryHover,
    ),
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
            final cardWidth = sizingInfo.isMobile
                ? 280.0
                : sizingInfo.isTablet
                ? 280.0
                : 300.0;
            final cardHeight = sizingInfo.isMobile
                ? 300.0
                : sizingInfo.isTablet
                ? 300.0
                : 300.0;

            final half = (_projects.length / 2).ceil();
            final firstRow = _projects.sublist(0, half);
            final secondRow = _projects.sublist(half);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'GitHub-driven case studies with focused descriptions and tech stacks.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 24),
                AutoScrollRow(
                  items: firstRow,
                  direction: ScrollDirection.leftToRight,
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                ),
                const SizedBox(height: 20),
                AutoScrollRow(
                  items: secondRow,
                  direction: ScrollDirection.rightToLeft,
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.techStack,
    required this.linkUrl,
    required this.imageUrl,
    required this.tag,
    required this.accent,
  });

  final String title;
  final String subtitle;
  final List<String> techStack;
  final String linkUrl;
  final String imageUrl;
  final String tag;
  final Color accent;
}

enum ScrollDirection { leftToRight, rightToLeft }

class AutoScrollRow extends StatefulWidget {
  const AutoScrollRow({
    super.key,
    required this.items,
    required this.direction,
    required this.cardWidth,
    required this.cardHeight,
    this.speed = 40,
  });

  final List<ProjectItem> items;
  final ScrollDirection direction;
  final double cardWidth;
  final double cardHeight;
  final double speed;

  @override
  State<AutoScrollRow> createState() => _AutoScrollRowState();
}

class _AutoScrollRowState extends State<AutoScrollRow>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late final Ticker _ticker;
  Duration? _lastTick;
  double _loopExtent = 0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _updateLoopExtent();
      _ticker.start();
    });
  }

  @override
  void didUpdateWidget(covariant AutoScrollRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateLoopExtent();
  }

  void _updateLoopExtent() {
    if (!_controller.hasClients) {
      return;
    }
    final maxExtent = _controller.position.maxScrollExtent;
    _loopExtent = maxExtent > 0 ? maxExtent / 2 : 0;
  }

  void _onTick(Duration elapsed) {
    if (!mounted || !_controller.hasClients) return;
    if (_loopExtent == 0) {
      _updateLoopExtent();
      return;
    }
    if (_lastTick == null) {
      _lastTick = elapsed;
      return;
    }

    final deltaSeconds = (elapsed - _lastTick!).inMicroseconds / 1e6;
    _lastTick = elapsed;
    final directionFactor = widget.direction == ScrollDirection.leftToRight
        ? 1.0
        : -1.0;
    var nextOffset =
        _controller.offset + directionFactor * widget.speed * deltaSeconds;
    if (_loopExtent > 0) {
      nextOffset %= _loopExtent;
      if (nextOffset < 0) {
        nextOffset += _loopExtent;
      }
    }

    _controller.jumpTo(nextOffset);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [...widget.items, ...widget.items];
    return SizedBox(
      height: widget.cardHeight,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == items.length - 1 ? 0 : 20),
            child: SizedBox(
              width: widget.cardWidth,
              height: widget.cardHeight,
              child: ProjectCard(project: items[index]),
            ),
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovered ? 0.12 : 0.06),
                blurRadius: isHovered ? 18 : 12,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _ProjectPreview(project: project),
                const SizedBox(height: 12),
                Text(
                  project.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  project.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.4,
                    color: project.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.techStack
                      .map(
                        (tech) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.chipLight,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.borderLight),
                          ),
                          child: Text(
                            tech,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                Link(
                  uri: Uri.parse(project.linkUrl),
                  builder: (context, followLink) {
                    return Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        color: project.accent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: followLink,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Visit ${project.title}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProjectPreview extends StatelessWidget {
  const _ProjectPreview({required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(project.imageUrl),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.35),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Text(
                project.tag,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
