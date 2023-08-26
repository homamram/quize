import 'dart:async';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quize/ui/shared/custom_widgets/custom_text.dart';
import 'package:quize/ui/views/main_views/home_view/select_specilazion/select_specilazion.dart';
import 'package:get/get.dart';
import '../../../../core/translation/app_translation.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text_field.dart';
import '../../../shared/utils.dart';
import '../../login_view/login_view.dart';
import 'AutoScrollPage_View/AutoScrollPageView.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}
TextEditingController c=TextEditingController();
HomePageController controller = Get.put(HomePageController());
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(

            children: [

                SvgPicture.asset(
                  "assets/images/shapemaker.svg",
                  width: screenWidth(1),
                  // height: screenHeight(6.3),
                ),

              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(8), start: screenWidth(15)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/ic_nav_bar_home.svg",
                      color:Colors.white,
                      height: screenWidth(20),
                    ),
                    SizedBox(
                      width: screenWidth(25),
                    ),
                   CustomText(text: "الرئيسية",
                   color: AppColors.mainWhiteColor,
                    size: screenWidth(20),
                   )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth(30)),
            child: Column(
              children: [
                CustomTextField(hitText: "بحث", controller: c, icon: Icons.search,
                textformcolor: AppColors.mainGreyColor,
                suffexicon:Icons.inventory_2_sharp ),
                // Container(
                //   width: screenWidth(3),
                //   height: screenWidth(3),
                //   child:AutoScrollPageView() ,
                // ),
                SizedBox(height: screenHeight(40),),
                Row(children: [
                  Container(
                    width: screenWidth(200),
                    height: screenWidth(8),
                    color: AppColors.mainBlackColor,
                  ),
                  SizedBox(width: screenHeight(40),),
                  CustomText(text: "التصنيفات",
                  color: AppColors.mainBlackColor, size: screenWidth(25),),


                ],),
                SizedBox(height: screenHeight(40),),
                SelectSpecilazion()



              ],
            ),
          ),




        ],
      ),
    ));
  }

  Widget navItem(
      {required String text,
      required bool isslected,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap;
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color:
                    isslected ? AppColors.mainBlueColor : AppColors.blackgrey),
          ),
          Container(
            height: screenWidth(200),
            width: screenWidth(8),
            color: isslected ? AppColors.mainBlueColor : AppColors.mainWhiteColor,
          ),
        ],
      ),
    );
  }
}

