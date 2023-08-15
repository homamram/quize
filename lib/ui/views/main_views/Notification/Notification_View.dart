import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quize/ui/shared/custom_widgets/custom_button.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/images/shapemaker.svg",
                    width: screenWidth(1),
                    // height: screenHeight(6.3),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenWidth(15), start: screenWidth(15)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_back.svg",
                          color: AppColors.mainWhiteColor,
                          height: screenWidth(15),
                        ),
                        SizedBox(
                          width: screenWidth(25),
                        ),
                        Text(
                          "الإشعارات",
                          style: TextStyle(
                              color: AppColors.mainWhiteColor,
                              fontSize: screenWidth(18)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(15)),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth(18),
                    ),
                    Center(
                      child: SvgPicture.asset("assets/images/rafiki.svg"),
                    ),
                    SizedBox(
                      height: screenWidth(20),
                    ),

                    Text(
                      "الإشعارات",
                      style: TextStyle(fontSize: screenWidth(13)),
                    ),
                    SizedBox(
                      height: screenWidth(20),
                    ),
                    Text("ابقى على إطلاع بمواعيد الإمتحان الوطني",style: TextStyle(fontSize: screenWidth(22)),),
                    Text("و صدور النتائج,إضافة أسئلة و الكثير من",style: TextStyle(fontSize: screenWidth(22)),),
                    Text("الأخبار",style: TextStyle(fontSize: screenWidth(22)),),
                    // Container(
                    //   height: 90,
                    //   width: 250,
                    //   child:Text("ابقى على إطلاع بمواعيد الإمتحان الوطني و صدور النتائج,إضافة أسئلة و الكثير من الأخبار",style: TextStyle(fontSize: screenWidth(22)),)
                    // ),
                    SizedBox(
                      height: screenWidth(15),
                    ),

                    CustomButton(text: "تفعيل الإشعارات", onPressed: () {},textSize: screenWidth(22)),
                    SizedBox(
                      height: screenWidth(20),
                    ),

                    Center(
                        child: CustomText(
                          text: "تجاهل",
                          color: AppColors.mainBlackColor,
                          underline: true,
                        )),
                  ],
                ),
              )
            ])));
  }
}