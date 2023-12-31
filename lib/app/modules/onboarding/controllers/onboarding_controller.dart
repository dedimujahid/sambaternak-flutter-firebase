import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sambaternak_flutter_fbs/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final currentIndex = 0.obs;

  PageController pageController = PageController();

  void changePage(int currentIndex) {
    this.currentIndex.value = currentIndex;
  }

  //* Function to handle button right

  void rightTap() {
    if (currentIndex.value != 2) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  //* Function to handle button left

  void leftTap() {
    if (currentIndex.value == 0) {
      pageController.animateToPage(
        currentIndex.value + 2,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.animateToPage(
        currentIndex.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
