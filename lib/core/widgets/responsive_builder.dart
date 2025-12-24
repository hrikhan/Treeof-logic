import 'package:flutter/material.dart';

import '../utils/breakpoints.dart';

class SizingInfo {
  const SizingInfo({
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  final DeviceType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = Breakpoints.deviceTypeForWidth(mediaQuery.size.width);
        final sizingInfo = SizingInfo(
          deviceType: deviceType,
          screenSize: mediaQuery.size,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );
        return builder(context, sizingInfo);
      },
    );
  }
}
