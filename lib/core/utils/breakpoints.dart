import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class Breakpoints {
  static const double mobileMax = 600;
  static const double tabletMax = 1024;

  static DeviceType deviceTypeForWidth(double width) {
    if (width < mobileMax) {
      return DeviceType.mobile;
    }
    if (width <= tabletMax) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }

  static EdgeInsets pagePadding(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.mobile:
        return const EdgeInsets.symmetric(horizontal: 16);
      case DeviceType.tablet:
        return const EdgeInsets.symmetric(horizontal: 40);
      case DeviceType.desktop:
        return const EdgeInsets.symmetric(horizontal: 160);
    }
  }
}
