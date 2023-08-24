
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quize/ui/shared/colors.dart';
import 'package:get/get.dart';
import 'package:quize/ui/shared/utils.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textFontWeight;
  final double? width;
  final Color? borderColor;
  final Color? backgroundColor;
  final Function onPressed;
  final String? svgName;

  const CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize,
    this.textFontWeight,
    this.borderColor,
    this.backgroundColor,
    required this.onPressed,
    this.svgName, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgName != null) ...[
            SvgPicture.asset('images/$svgName.svg'),
            SizedBox(
              width: screenWidth(50) ,
            )
          ],
          Text(
            text,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: textSize ??  screenWidth(25),
                fontWeight: textFontWeight ?? FontWeight.normal),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          side: borderColor != null
              ? BorderSide(
              width: 1, color: borderColor ?? AppColors.buttoncolor)
              : null,
          backgroundColor: backgroundColor ?? AppColors.buttoncolor,
          // shape: StadiumBorder(),
          fixedSize: Size( width??screenWidth(1),  screenWidth(7))),
    );
  }
}