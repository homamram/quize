import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:get/get.dart';
import '../../../../specializations_view/specializations_view.dart';
import '../home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SelectSpecilazion extends StatefulWidget {
  @override
  _SelectSpecilazionState createState() => _SelectSpecilazionState();
}

class _SelectSpecilazionState extends State<SelectSpecilazion> {
  bool isAllLineVisible = true;
  bool isEngineeringLineVisible = false;
  bool isMedicalLineVisible = false;

  Color allTextColor = Colors.blue;
  Color engineeringTextColor = Colors.black;
  Color medicalTextColor = Colors.black;

  void _handleAllButtonPressed() {
    setState(() {
      isAllLineVisible = !isAllLineVisible;
      isEngineeringLineVisible = false;
      isMedicalLineVisible = false;

      allTextColor = isAllLineVisible ? Colors.blue : Colors.black;
      engineeringTextColor = Colors.black;
      medicalTextColor = Colors.black;
    });
  }

  void _handleEngineeringButtonPressed() {
    setState(() {
      isAllLineVisible = false;
      isEngineeringLineVisible = !isEngineeringLineVisible;
      isMedicalLineVisible = false;

      allTextColor = Colors.black;
      engineeringTextColor =
          isEngineeringLineVisible ? Colors.blue : Colors.black;
      medicalTextColor = Colors.black;
    });
  }

  void _handleMedicalButtonPressed() {
    setState(() {
      isAllLineVisible = false;
      isEngineeringLineVisible = false;
      isMedicalLineVisible = !isMedicalLineVisible;

      allTextColor = Colors.black;
      engineeringTextColor = Colors.black;
      medicalTextColor = isMedicalLineVisible ? Colors.blue : Colors.black;
    });
  }
  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _handleAllButtonPressed,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          isAllLineVisible ? Colors.blue : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  'الجميع',
                  style: TextStyle(
                    fontSize: screenWidth(30),
                    color: allTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: _handleEngineeringButtonPressed,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isEngineeringLineVisible
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  'الهندسة',
                  style: TextStyle(
                    fontSize: screenWidth(30),

                    color: engineeringTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: _handleMedicalButtonPressed,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isMedicalLineVisible
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  'الطب',
                  style: TextStyle(
                    fontSize: screenWidth(30),
                    color: medicalTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Visibility(
          visible: isAllLineVisible,
          child: Column(
           children: [
             Obx((){
               return controller.ISMedecalCollagesLoading
                   ? SpinKitCircle(
                 color: Colors.red,
               )
                   :controller. MedecalCollageslist.isEmpty
                   ? Text('No Category') : SizedBox(
                 height: screenWidth(3.2),
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                   itemCount: controller.MedecalCollageslist.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Row(
                       children: [
                         Specliztion_widghet(
                           imgname: controller.MedecalCollageslist[index].image??'',
                           name:controller.MedecalCollageslist[index].collageName ?? '' ,
                         ),


                       ],
                     );
                   },
                 ),
               );
             }),
             SizedBox(height: screenHeight(50),),
             Obx((){
               return controller.ISEngineerCollagesLoading
                   ? SpinKitCircle(
                 color: Colors.red,
               )
                   :controller.EngineerCollageslist.isEmpty
                   ? Text('No Category') : SizedBox(
                 height: screenWidth(3.2),
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                   itemCount: controller.EngineerCollageslist.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Row(
                       children: [
                         InkWell(
                           onTap: (){
                             Get.to(specializationsView(specializationsname:controller.EngineerCollageslist[index].collageName ?? '' ,));
                           },
                           child: Specliztion_widghet(
                             imgname: controller.EngineerCollageslist[index].image??'',
                             name:controller.EngineerCollageslist[index].collageName ?? '' ,
                           ),
                         ),


                       ],
                     );
                   },
                 ),
               );
             }),
           ],
          ),
        ),
        Row(

          children: [
            Visibility(
              visible: isEngineeringLineVisible,

              child: Obx((){
                return controller.ISEngineerCollagesLoading
                    ? SpinKitCircle(
                  color: Colors.red,
                )
                    :controller.EngineerCollageslist.isEmpty
                    ? Text('No Category') : SizedBox(
                  height: screenWidth(3.2),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.EngineerCollageslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Specliztion_widghet(
                            imgname: controller.EngineerCollageslist[index].image??'',
                            name:controller.EngineerCollageslist[index].collageName ?? '' ,
                          ),


                        ],
                      );
                    },
                  ),
                );
              }),
            ),


          ],
        ),
        Visibility(
          visible: isMedicalLineVisible,
          child: Obx((){
            return controller.ISMedecalCollagesLoading
                ? SpinKitCircle(
              color: Colors.red,
            )
                :controller. MedecalCollageslist.isEmpty
                ? Text('No Category') : SizedBox(
              height: screenWidth(3.2),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.MedecalCollageslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Specliztion_widghet(
                        imgname: controller.MedecalCollageslist[index].image??'',
                        name:controller.MedecalCollageslist[index].collageName ?? '' ,
                      ),


                    ],
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}

class Specliztion_widghet extends StatelessWidget {
  const Specliztion_widghet(
      {Key? key, required this.imgname, required this.name})
      : super(key: key);
  final String imgname;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth(17)),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imgname,
            width: screenWidth(6),
            height: screenWidth(6),
          ),
          SizedBox(
            height: screenWidth(40),
          ),
          Text(name)
        ],
      ),
    );
  }
}
