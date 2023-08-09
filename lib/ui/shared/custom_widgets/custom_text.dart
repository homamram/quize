
import 'package:flutter/material.dart';
import 'package:quize/ui/shared/colors.dart';

import '../utils.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.color, this.size, this.underline}) : super(key: key);
final String text;
final Color? color;
final double? size;
final bool? underline;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color??AppColors.mainTextColor,
        fontSize: size??screenWidth(25),decoration:underline??false? TextDecoration.underline:null,),
    );
  }
}
