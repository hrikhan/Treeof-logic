import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../theme/app_theme.dart';
import 'hover.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.label,
    required this.url,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w600,
    this.color,
    this.hoverColor,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  final String label;
  final String url;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final Color? hoverColor;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);
    final target = _targetForUri(uri);
    return HoverRegion(
      builder: (context, isHovered) {
        final baseColor = color ?? AppColors.textMuted;
        final activeColor = hoverColor ?? AppColors.primary;
        return Link(
          uri: uri,
          target: target,
          builder: (context, followLink) => GestureDetector(
            onTap: followLink,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: isHovered ? activeColor : baseColor,
                decoration: TextDecoration.underline,
                decorationColor: isHovered ? activeColor : baseColor,
              ),
              child: Text(
                label,
                maxLines: maxLines,
                overflow: overflow,
              ),
            ),
          ),
        );
      },
    );
  }
}

LinkTarget _targetForUri(Uri uri) {
  switch (uri.scheme) {
    case 'http':
    case 'https':
      return LinkTarget.blank;
    default:
      return LinkTarget.self;
  }
}
