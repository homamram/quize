
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quize/ui/shared/colors.dart';
import 'package:quize/ui/shared/custom_widgets/custom_button.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/custom_widgets/custom_text_field.dart';
import 'login_view_controler.dart';
import 'package:get/get.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
  }

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
body: Form(
  key: _loginController.loginkey,
  child:   Padding(
    padding:  EdgeInsets.symmetric(vertical: screenHeight(30),horizontal:screenHeight(30) ),
    child:   ListView(children: [
      Center(child: CustomText(text: 'تسجيل الدخول',color: AppColors.mainBlackColor,size: screenHeight(30))),
      Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight(30)),
        child: Center(child: SvgPicture.asset("assets/images/Login.svg")),
      ),
      CustomText(text: 'اسم المستخدم',),
      CustomTextField(hitText: 'اسم المستخدم', controller:_loginController.usernameController ,
         img: "ic_profile",validator: (value){
        if(value!.isEmpty)
          return 'الرجاء ادخال اسمك';
          }
          ,
          icon: Icons.person),
      CustomText(text: 'رمز الدخول',),
      CustomTextField(hitText: 'رمز الدخول', controller:_loginController.codeController ,icon: Icons.person,
          validator: (value){
            if(value!.isEmpty)
              return 'الرجاء ادخال رمز الدخول';
          }),
      CustomButton(text: "تسجيل الدخول", onPressed: (){
        _loginController.validateLogin();
      }),
      Padding(
        padding:  EdgeInsets.only(top: screenHeight(50),bottom: screenHeight(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,

          children: [
          CustomText(text: "ليس لديك حساب ؟",color: AppColors.mainBlackColor,),
          CustomText(text: "انشاء حسابك الان",),
        ],),

      ),
      Center(child: CustomText(text: "المتابعة كزائر",color: AppColors.mainBlackColor,underline: true,)),



    ],),
  ),
)

    ));
  }
}
