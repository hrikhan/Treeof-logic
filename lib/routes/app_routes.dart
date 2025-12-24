import 'package:flutter/widgets.dart';

import '../feature/home/view/home_page.dart';

class AppRoutes {
  static const String home = '/';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => HomePage(),
  };
}
