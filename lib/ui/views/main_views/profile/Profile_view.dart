import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quize/ui/shared/custom_widgets/custom_button.dart';
import 'package:quize/ui/shared/custom_widgets/custom_text.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
import '../../../shared/colors.dart';
import '../../../shared/utils.dart';
import 'package:get/get.dart';

import '../home_view/home_View.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      // SvgPicture.asset(
                      //   "assets/images/ic_back.svg",
                      //   color: AppColors.mainWhiteColor,
                      //   height: screenWidth(15),
                      // ),
                      Icon(Icons.person_outline,
                          color: AppColors.mainWhiteColor, size: screenWidth(13)),
                      SizedBox(
                        width: screenWidth(25),
                      ),
                      CustomText(

                        text: "الملف الشخصي",
                        size:screenWidth(18) ,
                        color: AppColors.mainWhiteColor ,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Stack(children: [SvgPicture.asset("assets/images/User.svg")]),
            SizedBox(height: screenWidth(5),),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: InkWell(onTap: () => Get.to(LoginView()),
                child: Row(children: [
                  Container(height: 35,width: 2,color: AppColors.buttoncolor,),

                  CustomText(text:"   المعلومات الشخصية",size: screenWidth(22),),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(2.3)),
                    child: SvgPicture.asset("assets/images/ic_edit.svg"),
                  ),
                ],),
              ),
            ),
            SizedBox(height: screenWidth(15),),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: InkWell(onTap:  (){},
                child: Row(children: [
                  Container(height: 35,width: 2,color: AppColors.mainBlueColor,),

                  CustomText(text:"  ارسال شكاوي",size: screenWidth(22),color: AppColors.mainBlueColor,),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(1.8)),
                    child: SvgPicture.asset("assets/images/ic_send_feedback.svg",color: AppColors.mainBlueColor,),
                  ),
                ],),
              ),
            ),
            SizedBox(height: screenWidth(15),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: InkWell(
                child: Row(children: [
                  Container(height: 35,width: 2,color: AppColors.mainTextColor,),

                  CustomText(text:"  عن التطبيق",size: screenWidth(22),color: AppColors.mainTextColor,),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: screenWidth(1.7)),
                    child: SvgPicture.asset("assets/images/details.svg"),
                  ),
                ],),
              ),

            ),
            SizedBox(height: screenWidth(15),),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth(15)),

              child: CustomButton(text: "تسجيل خروج", onPressed: (){}),
            )
          ]),
        ));
  }
}