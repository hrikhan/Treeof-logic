import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/hover.dart';
import '../../../core/widgets/link_text.dart';
import '../../../core/widgets/responsive_builder.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const List<_ContactInfoItem> _infoItems = [
    _ContactInfoItem(
      icon: Icons.email_outlined,
      label: 'Email',
      value: 'hridoykhan.cse.cu@gmail.com',
      link: 'mailto:hridoykhan.cse.cu@gmail.com',
    ),
    _ContactInfoItem(
      icon: Icons.phone_outlined,
      label: 'Phone',
      value: '01779799197',
      link: 'tel:+8801779799197',
    ),
  ];

  static const List<_SocialLink> _socialLinks = [
    _SocialLink(label: 'GitHub', url: 'https://github.com/hrikhan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ResponsiveBuilder(
        builder: (context, sizingInfo) {
          final isDesktop = sizingInfo.isDesktop;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: _ContactInfo(
                        infoItems: _infoItems,
                        socialLinks: _socialLinks,
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(child: _ContactFormCard()),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _ContactInfo(
                      infoItems: _infoItems,
                      socialLinks: _socialLinks,
                    ),
                    SizedBox(height: 24),
                    _ContactFormCard(),
                  ],
                ),
              const SizedBox(height: 32),
              const Divider(color: AppColors.borderLight, height: 1),
              const SizedBox(height: 16),
              const _ContactFooter(),
            ],
          );
        },
      ),
    );
  }
}

class _ContactInfoItem {
  const _ContactInfoItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.link,
  });

  final IconData icon;
  final String label;
  final String value;
  final String link;
}

class _SocialLink {
  const _SocialLink({required this.label, required this.url});

  final String label;
  final String url;
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({required this.infoItems, required this.socialLinks});

  final List<_ContactInfoItem> infoItems;
  final List<_SocialLink> socialLinks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CONTACT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Let's Discuss Your Project",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Have an idea for a mobile app? I am currently available for '
          'freelance work and open to new opportunities.',
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 24),
        ...infoItems
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ContactInfoRow(item: item),
              ),
            )
            .toList(),
        const SizedBox(height: 12),
        const Text(
          'SOCIALS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          children: socialLinks
              .map(
                (link) => LinkText(
                  label: link.label,
                  url: link.url,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  hoverColor: AppColors.primary,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  const _ContactInfoRow({required this.item});

  final _ContactInfoItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(item.icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 4),
            LinkText(
              label: item.value,
              url: item.link,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              hoverColor: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactFormCard extends StatelessWidget {
  const _ContactFormCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ResponsiveBuilder(
        builder: (context, sizingInfo) {
          final isMobile = sizingInfo.isMobile;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMobile)
                const _LabeledField(label: 'Name', hintText: 'John Doe'),
              if (isMobile) const SizedBox(height: 16),
              if (isMobile)
                const _LabeledField(
                  label: 'Email',
                  hintText: 'john@company.com',
                  keyboardType: TextInputType.emailAddress,
                ),
              if (!isMobile)
                Row(
                  children: const [
                    Expanded(
                      child: _LabeledField(label: 'Name', hintText: 'John Doe'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _LabeledField(
                        label: 'Email',
                        hintText: 'john@company.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              const _LabeledField(
                label: 'Subject',
                hintText: 'Project Inquiry',
              ),
              const SizedBox(height: 16),
              const _LabeledField(
                label: 'Message',
                hintText: 'Tell me about your project...',
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              const _SendButton(),
            ],
          );
        },
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFB6C0CC)),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, isHovered) {
        return GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isHovered ? const Color(0xFF0F6ED4) : AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ContactFooter extends StatelessWidget {
  const _ContactFooter();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final isMobile = sizingInfo.isMobile;
        final copyright = Text(
          '© 2025 Hridoy Khan. All rights reserved.',
          style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
        );
        final links = Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            LinkText(
              label: 'Privacy Policy',
              url: 'https://example.com/privacy',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              hoverColor: AppColors.primary,
            ),
            SizedBox(width: 16),
            LinkText(
              label: 'Terms of Service',
              url: 'https://example.com/terms',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              hoverColor: AppColors.primary,
            ),
          ],
        );

        if (isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [copyright, const SizedBox(height: 8), links],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [copyright, links],
        );
      },
    );
  }
}
