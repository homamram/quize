import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/bottom_navigation.dart';
import '../../../shared/colors.dart';
import '../../../shared/utils.dart';



class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
      {super.key, required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: screenWidth(1),
          height: screenHeight(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9)),
        ),
        Positioned(
          bottom: screenWidth(12),
          left: screenWidth(20),
          right: screenWidth(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              navItem(
                ontap: () {
                  widget.ontap(BottomNavigationEnum.PROFILE, 3);
                },
                imagename: 'ic_nav_bar_profile',
                isslected: widget.navitm == BottomNavigationEnum.PROFILE,
              ),
              SizedBox(
                width: screenWidth(12),
              ),
              navItem(
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.STAR, 2);
                  },
                  imagename: 'ic_star_empty',
                  isslected: widget.navitm == BottomNavigationEnum.STAR),
              SizedBox(
                width: screenWidth(12),
              ),
              navItem(
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.HOME, 1);
                  },
                  imagename: 'ic_nav_bar_home',
                  isslected: widget.navitm == BottomNavigationEnum.HOME),
              SizedBox(
                width: screenWidth(12),
              ),
              navItem(
                  ontap: () {
                    widget.ontap(BottomNavigationEnum.NOTIFICATION, 0);
                  },
                  imagename: 'ic_nav_bar_notifications',
                  isslected:
                      widget.navitm == BottomNavigationEnum.NOTIFICATION),
            ],
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required String imagename,
      required bool isslected,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$imagename.svg',
            color: isslected
                ? AppColors.buttoncolor
                : AppColors.buttoncolor,
            width: isslected
                ? screenWidth(18)
                : screenWidth(20), // تحديد حجم الصورة بناءً على isSelected
          ),
          SizedBox(
            height: screenWidth(60),
          ),
          Container(
            height: screenWidth(200),
            width: screenWidth(8), // تعديل ارتفاع الخط حسب الحاجة
            color: isslected
                ? AppColors.buttoncolor
                : Colors.transparent, // تحديد لون الخط بناءً على isSelected
          ),
        ],
      ),
    );
  }
}

