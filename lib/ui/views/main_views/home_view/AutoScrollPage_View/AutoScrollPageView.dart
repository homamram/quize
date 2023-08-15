import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/utils.dart';
import 'package:get/get.dart';

import 'autoscrollpage_controller.dart';
class AutoScrollPageView extends StatelessWidget {
  final controller = Get.put(AutoScrollPageViewController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() => PageView.builder(
            controller: PageController(initialPage: controller.currentPage.value),
            itemCount: controller.pageCount,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Image.asset(
                  'assets/images/image_$index.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
            onPageChanged: (int index) {
              controller.currentPage.value = index;

            },
          )),
        ),
        SizedBox(height: screenWidth(40)),
        buildPageIndicator(),
      ],
    );
  }

  Widget buildPageIndicator() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(controller.pageCount, (int index) {
        return Container(
          width: screenWidth(50),
          height: screenWidth(50),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.buttoncolor),
            shape: BoxShape.rectangle,
            color: controller.currentPage.value == index ? AppColors.buttoncolor : Colors.white,
          ),
        );
      }),
    ));
  }
}
