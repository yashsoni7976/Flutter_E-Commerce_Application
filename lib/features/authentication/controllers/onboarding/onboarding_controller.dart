import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value=index;

  /// Jump to specific dot selected Page
  void dotNavigatonClick(index){
    currentPageIndex.value=index;
    pageController.jumpTo(index);
  }

  /// Update the Current Page and jump to next page
  void nextPage() {
    final storage = GetStorage();
    storage.write('isFirstTime', false);
    if(currentPageIndex.value==2){
      Get.offAll(const LoginScreen());
    }
    else{
      int page = currentPageIndex.value+1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index and jump to the Last Page
  void skipPage() {
    currentPageIndex.value=2;
    pageController.jumpToPage(2);
  }
}