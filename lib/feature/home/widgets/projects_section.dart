import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/hover.dart';
import '../../../core/widgets/link_text.dart';
import '../../../core/widgets/responsive_builder.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<ProjectItem> _projects = [
    ProjectItem(
      title: 'Aurora Shop',
      category: 'E-commerce Apps',
      description: 'Multi-vendor catalog with smart search and smooth checkout.',
      techStack: ['Flutter', 'Dart', 'Firebase', 'Stripe'],
      repoUrl: 'https://github.com/hrikhan/aurora-shop',
      imageName: 'project_01.jpg',
    ),
    ProjectItem(
      title: 'Cartly Market',
      category: 'E-commerce Apps',
      description: 'Grocery ordering with real-time inventory and delivery slots.',
      techStack: ['Flutter', 'Dart', 'Firebase', 'Maps'],
      repoUrl: 'https://github.com/hrikhan/cartly-market',
      imageName: 'project_02.jpg',
    ),
    ProjectItem(
      title: 'Trendify Store',
      category: 'E-commerce Apps',
      description: 'Fashion storefront with wishlists and order tracking.',
      techStack: ['Flutter', 'Dart', 'REST', 'Hive'],
      repoUrl: 'https://github.com/hrikhan/trendify-store',
      imageName: 'project_03.jpg',
    ),
    ProjectItem(
      title: 'QuickCart POS',
      category: 'E-commerce Apps',
      description: 'Point-of-sale companion with barcode scanning.',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      repoUrl: 'https://github.com/hrikhan/quickcart-pos',
      imageName: 'project_04.jpg',
    ),
    ProjectItem(
      title: 'FreshBasket',
      category: 'E-commerce Apps',
      description: 'Subscription baskets with reminders and delivery insights.',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      repoUrl: 'https://github.com/hrikhan/freshbasket',
      imageName: 'project_05.jpg',
    ),
    ProjectItem(
      title: 'ChatWave',
      category: 'Chat Applications',
      description: 'Group messaging with media sharing and reactions.',
      techStack: ['Flutter', 'Dart', 'Firebase', 'WebSockets'],
      repoUrl: 'https://github.com/hrikhan/chatwave',
      imageName: 'project_06.jpg',
    ),
    ProjectItem(
      title: 'Pulse Talk',
      category: 'Chat Applications',
      description: 'Secure 1:1 chat with read receipts and typing status.',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      repoUrl: 'https://github.com/hrikhan/pulse-talk',
      imageName: 'project_07.jpg',
    ),
    ProjectItem(
      title: 'TeamSync',
      category: 'Chat Applications',
      description: 'Work chat with channels, mentions, and quick search.',
      techStack: ['Flutter', 'Dart', 'REST'],
      repoUrl: 'https://github.com/hrikhan/teamsync',
      imageName: 'project_08.jpg',
    ),
    ProjectItem(
      title: 'Orbit Messenger',
      category: 'Chat Applications',
      description: 'Voice notes and message scheduling for remote teams.',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      repoUrl: 'https://github.com/hrikhan/orbit-messenger',
      imageName: 'project_09.jpg',
    ),
    ProjectItem(
      title: 'Relay Chat',
      category: 'Chat Applications',
      description: 'Lightweight chat UI kit for rapid prototypes.',
      techStack: ['Flutter', 'Dart'],
      repoUrl: 'https://github.com/hrikhan/relay-chat',
      imageName: 'project_10.jpg',
    ),
    ProjectItem(
      title: 'VaultPay',
      category: 'Banking & Financial Tools',
      description: 'Personal finance dashboard with insights and goals.',
      techStack: ['Flutter', 'Dart', 'Charts'],
      repoUrl: 'https://github.com/hrikhan/vaultpay',
      imageName: 'project_11.jpg',
    ),
    ProjectItem(
      title: 'Ledgerly',
      category: 'Banking & Financial Tools',
      description: 'Expense tracking with smart budgets and alerts.',
      techStack: ['Flutter', 'Dart', 'SQLite'],
      repoUrl: 'https://github.com/hrikhan/ledgerly',
      imageName: 'project_12.jpg',
    ),
    ProjectItem(
      title: 'Prism Wallet',
      category: 'Banking & Financial Tools',
      description: 'Digital wallet with card management and security controls.',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      repoUrl: 'https://github.com/hrikhan/prism-wallet',
      imageName: 'project_13.jpg',
    ),
    ProjectItem(
      title: 'SafeSpend',
      category: 'Banking & Financial Tools',
      description: 'Spend limits and alerts for teams and families.',
      techStack: ['Flutter', 'Dart', 'REST'],
      repoUrl: 'https://github.com/hrikhan/safespend',
      imageName: 'project_14.jpg',
    ),
    ProjectItem(
      title: 'Capital Flow',
      category: 'Banking & Financial Tools',
      description: 'Loan calculator and repayment planner.',
      techStack: ['Flutter', 'Dart'],
      repoUrl: 'https://github.com/hrikhan/capital-flow',
      imageName: 'project_15.jpg',
    ),
    ProjectItem(
      title: 'Flutter Lab',
      category: 'Flutter Experiments',
      description: 'Component playground with design tokens.',
      techStack: ['Flutter', 'Dart'],
      repoUrl: 'https://github.com/hrikhan/flutter-lab',
      imageName: 'project_16.jpg',
    ),
    ProjectItem(
      title: 'Motion Kit',
      category: 'Flutter Experiments',
      description: 'Animation studies with micro-interactions.',
      techStack: ['Flutter', 'Dart'],
      repoUrl: 'https://github.com/hrikhan/motion-kit',
      imageName: 'project_17.jpg',
    ),
    ProjectItem(
      title: 'AR Notes',
      category: 'Flutter Experiments',
      description: 'Spatial note concept using device sensors.',
      techStack: ['Flutter', 'Dart'],
      repoUrl: 'https://github.com/hrikhan/ar-notes',
      imageName: 'project_18.jpg',
    ),
    ProjectItem(
      title: 'Smart Home Demo',
      category: 'Flutter Experiments',
      description: 'IoT dashboard with live device states.',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      repoUrl: 'https://github.com/hrikhan/smart-home-demo',
      imageName: 'project_19.jpg',
    ),
    ProjectItem(
      title: 'Pulse Viz',
      category: 'Flutter Experiments',
      description: 'Realtime data visualization playground.',
      techStack: ['Flutter', 'Dart', 'WebSockets'],
      repoUrl: 'https://github.com/hrikhan/pulse-viz',
      imageName: 'project_20.jpg',
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
                ? 240.0
                : sizingInfo.isTablet
                    ? 280.0
                    : 320.0;
            final cardHeight = sizingInfo.isMobile
                ? 280.0
                : sizingInfo.isTablet
                    ? 300.0
                    : 320.0;

            final firstRow = _projects.sublist(0, 10);
            final secondRow = _projects.sublist(10);

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
                const SizedBox(height: 12),
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
    required this.category,
    required this.description,
    required this.techStack,
    required this.repoUrl,
    required this.imageName,
  });

  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String repoUrl;
  final String imageName;
}

enum ScrollDirection { leftToRight, rightToLeft }

class AutoScrollRow extends StatefulWidget {
  const AutoScrollRow({
    super.key,
    required this.items,
    required this.direction,
    required this.cardWidth,
    required this.cardHeight,
    this.speed = 0.6,
  });

  final List<ProjectItem> items;
  final ScrollDirection direction;
  final double cardWidth;
  final double cardHeight;
  final double speed;

  @override
  State<AutoScrollRow> createState() => _AutoScrollRowState();
}

class _AutoScrollRowState extends State<AutoScrollRow> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;
  double _loopExtent = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _updateLoopExtent();
      if (widget.direction == ScrollDirection.rightToLeft &&
          _controller.hasClients) {
        _controller.jumpTo(_loopExtent);
      }
      _timer ??= Timer.periodic(const Duration(milliseconds: 16), _tick);
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

  void _tick(Timer timer) {
    if (!_controller.hasClients || _loopExtent == 0) {
      _updateLoopExtent();
      return;
    }

    final delta = widget.direction == ScrollDirection.leftToRight
        ? widget.speed
        : -widget.speed;
    var nextOffset = _controller.offset + delta;

    if (nextOffset >= _loopExtent) {
      nextOffset -= _loopExtent;
    } else if (nextOffset < 0) {
      nextOffset += _loopExtent;
    }

    _controller.jumpTo(nextOffset);
  }

  @override
  void dispose() {
    _timer?.cancel();
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
            padding: EdgeInsets.only(
              right: index == items.length - 1 ? 0 : 20,
            ),
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
              children: [
                _ProjectPreview(
                  category: project.category,
                  imageName: project.imageName,
                ),
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
                const SizedBox(height: 6),
                Text(
                  project.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.techStack
                      .map((tech) => _TechChip(label: tech))
                      .toList(),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.link, size: 16, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Expanded(
                      child: LinkText(
                        label: project.repoUrl.replaceFirst('https://', ''),
                        url: project.repoUrl,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                    ),
                  ],
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
  const _ProjectPreview({required this.category, required this.imageName});

  final String category;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.15),
            const Color(0xFFE8EEF5),
          ],
        ),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Stack(
        children: [
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
                category,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.image_outlined,
              size: 26,
              color: AppColors.primary,
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 8,
            child: Text(
              imageName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.chipLight,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
