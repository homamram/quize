import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quize/core/enums/academic_specialization.dart';
import 'package:quize/ui/shared/custom_widgets/custom_button.dart';
import 'package:quize/ui/shared/colors.dart';
import 'package:quize/ui/shared/custom_widgets/custom_text.dart';
import 'package:quize/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:quize/ui/views/sing_up/singup_controller.dart';
import '../login_view/login_view_controler.dart';

class SingupView extends StatelessWidget {
  final SingupViewController controller = Get.put(SingupViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.singupkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(30),
              horizontal: screenHeight(30),
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/images/ic_back.svg"),
                    ),
                    SizedBox(width: screenWidth(4)),
                    Center(
                      child: CustomText(
                        text: 'انشاء حساب',
                        color: AppColors.mainBlackColor,
                        size: screenHeight(30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight(30)),
                  child: Center(
                    child: SvgPicture.asset("assets/images/signup.svg"),
                  ),
                ),
                CustomText(text: 'اسم المستخدم'),
                CustomTextField(
                  hitText: 'اسم المستخدم',
                  controller: controller.nameController,
                  icon: Icons.person,
                  validator: (value) {
                    if (value!.isEmpty) return 'الرجاء ادخال اسمك';
                  },
                ),
                CustomText(text: 'رقم الموبايل'),
                CustomTextField(
                  hitText: 'رقم الموبايل',
                  controller: controller.numberController,
                  icon: Icons.phone_enabled,
                  img: "ic_profile",
                  validator: (value) {
                    if (value!.isEmpty) return 'الرجاء ادخالرقم الموبايل';
                  },
                ),
                CustomText(text: 'اختر التخصص'),
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: AcademicSpecialization.Medicine,
                        activeColor: AppColors.buttoncolor,
                        groupValue: controller.specialization.value,
                        onChanged: (value) {
                          controller.specialization.value = value!;
                          print(value);
                        },
                      ),
                      CustomText(
                        text: "الطب البشري",
                        size: screenWidth(36),
                      ),
                      Radio(
                        value: AcademicSpecialization.Dentist,
                        groupValue: controller.specialization.value,
                        activeColor: AppColors.buttoncolor,
                        onChanged: (value) {
                          controller.specialization.value = value!;
                          print(value);
                        },
                      ),
                      CustomText(text: "طب الاسنان", size: screenWidth(36)),
                      Radio(
                        value: AcademicSpecialization.Pharmacy,
                        groupValue: controller.specialization.value,
                        activeColor: AppColors.buttoncolor,
                        onChanged: (value) {
                          controller.specialization.value = value!;
                          print(value);
                        },
                      ),
                      CustomText(text: "كلية الصيدلة", size: screenWidth(36)),
                    ],
                  ),
                ),
                Obx(
                      () => Row(
                    children: [
                      Radio(
                        value: AcademicSpecialization.IT,
                        activeColor: AppColors.buttoncolor,
                        groupValue: controller.specialization.value,
                        onChanged: (value) {
                          controller.specialization.value = value!;
                          print(value);
                        },
                      ),
                      CustomText(
                        text: 'الهندسة المعلوماتية',
                        size: screenWidth(36),
                      ),
                      Radio(
                        value: AcademicSpecialization.ArchitecturalEngineering,
                        groupValue: controller.specialization.value,
                        activeColor: AppColors.buttoncolor,
                        onChanged: (value) {
                          controller.specialization.value = value!;
                          print(value);
                        },
                      ),
                      CustomText(
                        text: 'الهندسة المعمارية',
                        size: screenWidth(36),
                      ),
                      Radio(
                        value: AcademicSpecialization.Nursing,
                        groupValue: controller.specialization.value,
                        activeColor: AppColors.buttoncolor,
                        onChanged: (value) {
                          controller.specialization.value = value!;
                          print(value);
                        },
                      ),
                      CustomText(text: "التمريض", size: screenWidth(36)),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight(60)),
                CustomButton(
                  text: "انشاء الحساب",
                  onPressed: () {
                    controller.validatesignup();

                  },
                ),
                SizedBox(height: screenHeight(80)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "لديك حساب؟",
                      color: AppColors.mainBlackColor,
                    ),
                    CustomText(text: "تسجيل الدخول"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
