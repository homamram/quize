
import 'package:flutter/material.dart';
import 'package:quize/ui/specializations_view/speclizion_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../shared/colors.dart';
import '../shared/custom_widgets/custom_text.dart';
import '../shared/custom_widgets/custom_text_field.dart';
import '../shared/utils.dart';
import '../views/main_views/home_view/home_View.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class specializationsView extends StatefulWidget {
  final String specializationsname;
  const specializationsView({Key? key, required this.specializationsname}) : super(key: key);

  @override
  State<specializationsView> createState() => _specializationsViewState();
}

class _specializationsViewState extends State<specializationsView> {
  SpeclizionController controller = Get.put(SpeclizionController());

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
                    color: AppColors.mainBlueColor,

                    width: screenWidth(1),
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
                      CustomText(text: widget.specializationsname,
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

                  SizedBox(height: screenHeight(40),),




                ],
              ),
            ),
            SizedBox(height: screenHeight(50),),
            Obx((){
              return controller.ISspecializationLoading
                  ? SpinKitCircle(
                color: Colors.red,
              )
                  :controller. specialization.isEmpty
                  ? Text('No Category') : SizedBox(
                height: screenWidth(3.2),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.specialization.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: screenWidth(2),
                          height: screenWidth(4),
                          child: CustomText(
                            text: controller.specialization[index].specializationName??'' ,
                          ),
                        )


                      ],
                    );
                  },
                ),
              );
            }),


          ],


        ),
      ),
    );
  }
}
