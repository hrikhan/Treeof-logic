import 'package:get/get.dart';

class SplashLogoController extends GetxController {
  final RxDouble scale = 1.0.obs;
  final RxBool isHovered = false.obs;

  void updateScale(double value) {
    scale.value = 1 + value;
  }

  void toggleHover(bool hovered) {
    isHovered.value = hovered;
  }
}
