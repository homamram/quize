import 'package:flutter/material.dart';
import 'package:quize/ui/shared/colors.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';
class CustomTextField extends StatelessWidget {
  final String hitText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? img;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.hitText,
    required this.controller,
    this.validator, this.img, required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsetsDirectional.only(
         top: screenWidth(40),
          bottom:  screenWidth(100/7)),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.width * 0.05),
            hintText: hitText,
            hintStyle: TextStyle(
              color: AppColors.hintcolor
            ),
            prefixIcon:Icon(icon),
            prefixIconColor:AppColors.hintcolor ,
            filled: true,
            fillColor: AppColors.textFormfieldcolor,
            border: OutlineInputBorder(
                borderSide: BorderSide.none)),
        //  validator: (value) => validator != null ? validator!(value!) : null,
      ),
    );
  }
}
