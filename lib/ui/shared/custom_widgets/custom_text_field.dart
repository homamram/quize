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
  final IconData? suffexicon;

  final TextInputType? type;
  final Color? textformcolor;

  const CustomTextField({
    Key? key,
    required this.hitText,
    required this.controller,
    this.validator, this.img, required this.icon, this.type, this.textformcolor, this.suffexicon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsetsDirectional.only(
         top: screenWidth(40),
          bottom:  screenWidth(100/7)),
      child: TextFormField(
        keyboardType:type??TextInputType.text,
        validator: validator,
        controller: controller,

        decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(
                horizontal: 0, vertical: 0),
            hintText: hitText,
            hintStyle: TextStyle(
              color: AppColors.hintcolor
            ),
            prefixIcon:Icon(icon),
            suffixIcon: Icon(suffexicon),
            suffixIconColor:AppColors.hintcolor  ,
            prefixIconColor:AppColors.hintcolor ,
            filled: true,
            fillColor:textformcolor?? AppColors.textFormfieldcolor,
            border: OutlineInputBorder(
                borderSide: BorderSide.none)),
        //  validator: (value) => validator != null ? validator!(value!) : null,
      ),
    );
  }
}
