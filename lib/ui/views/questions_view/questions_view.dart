import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:quize/ui/shared/custom_widgets/custom_button.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
import 'package:quize/ui/views/login_view/login_view_controler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:quize/ui/views/questions_view/questions_controller.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_text.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  final QuestionsController controller = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // backgroundColor: AppColors.buttoncolor,
          body: Obx(
                () => Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/shapemaker.svg",
                      width: screenWidth(1),
                      color: Colors.blue,
                      // height: screenHeight(6.3),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: screenWidth(8), start: screenWidth(15)),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/ic_back.svg",
                            color: Colors.white,
                            height: screenWidth(20),
                          ),
                          SizedBox(
                            width: screenWidth(25),
                          ),
                          CustomText(
                            text: "كلية الهندسة المعلوماتية",
                            color: AppColors.mainWhiteColor,
                            size: screenWidth(20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: screenWidth(23), end: screenWidth(23)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenWidth(28),
                      ),
                      Text("${controller.questionNum.value} / 100"),
                      SizedBox(
                        height: screenWidth(50),
                      ),
                      Container(
                        width: screenWidth(1.1),
                        height: screenWidth(28),
                        child: LinearProgressIndicator(
                          value: controller.progress.value / 100,
                          backgroundColor: Colors.blue, // Initial color
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.buttoncolor), // Changing color
                        ),
                      ),
                      SizedBox(height: screenWidth(25)),
                      Obx((){
                        return controller.ISQuestionsLoading
                            ? SpinKitCircle(
                          color: Colors.red,
                        )
                            :controller. Questions.isEmpty
                            ? Text('No Category') : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context,index ) {
                            print(index);
                            return Column(
                                children: [
                                  Text("${controller.Questions[controller.index.value].content}"),
                                  Column(
                                    children: [Container(
                                      margin: EdgeInsets.all(screenWidth(40)),
                                      padding: EdgeInsets.all(screenWidth(40)),
                                      // transform: Matrix4.rotationZ(0.05),
                                      child: GestureDetector(
                                          onTap: () {

                                          },
                                          child: Column(
                                              children:  List.generate(controller.options[0].length , (i) {
                                                return  Container(child: Text(controller.options[controller.index.value][i]),


                                                );
                                              })
                                          )

                                      ),
                                    )],

                                  )
                                ]
                            );
                          },
                        );
                      }),

                      SizedBox(
                        height: screenWidth(150),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth(30)),
                        child: Row(
                          children: [
                            InkWell(
                                child: SvgPicture.asset(
                                  "assets/images/correct.svg",
                                  width: 10,
                                  height: 20,
                                )),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                                child: SvgPicture.asset(
                                  "assets/images/book.svg",
                                  width: 10,
                                  height: 20,
                                )),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                                child: SvgPicture.asset(
                                  "assets/images/ic_star_empty.svg",
                                  width: 10,
                                  height: 20,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: "السابق",
                            onPressed: () {
                              controller.decreaseProgress();

                            },
                            width: screenWidth(
                              4,
                            ),
                            backgroundColor: AppColors.mainWhiteColor,
                            textColor: AppColors.buttoncolor,
                            borderColor: AppColors.buttoncolor,
                            textSize: screenWidth(20),
                          ),
                          CustomButton(
                            text: "التالي",
                            onPressed: () {
                              controller.increaseProgress();
                              if(controller.index.value<controller.Questions.length-1)
                              {  controller.incress();}
                            },
                            width: screenWidth(4),
                            backgroundColor: AppColors.mainWhiteColor,
                            textColor: AppColors.buttoncolor,
                            borderColor: AppColors.buttoncolor,
                            textSize: screenWidth(20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
