import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quize/ui/shared/custom_widgets/custom_button.dart';
import 'package:quize/ui/shared/custom_widgets/custom_text.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
import '../../../shared/colors.dart';
import '../../../shared/utils.dart';
import 'package:get/get.dart';

import '../Notification/Notification_View.dart';
import '../home_view/home_View.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker picker = ImagePicker();
  bool visible = false;
  late XFile? file = XFile('');
  FileModel? selectedFile;
  bool showOptions = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/shapemaker.svg",
                  width: screenWidth(1),
// height: screenHeight(6.3),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(15), start: screenWidth(15)),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline,
                          color: AppColors.mainWhiteColor, size: screenWidth(13)),
                      SizedBox(
                        width: screenWidth(25),
                      ),
                      Text(
                        "الملف الشخصي",
                        style: TextStyle(
                            color: AppColors.mainWhiteColor,
                            fontSize: screenWidth(18)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: selectedFile == null || selectedFile!.path.isEmpty
                  ? () {
                setShowOPtion(true);
              }
                  : null,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.buttoncolor,
                child: selectedFile == null
                    ? Icon(Icons.person)
                    : selectedFile!.path.isNotEmpty &&
                    selectedFile!.type == FileType.FILE
                    ? Icon(Icons.file_copy)
                    : selectedFile!.path.isNotEmpty
                    ? Image.file(File(selectedFile!.path))
                    : Icon(Icons.person),
              ),
            ),
            Visibility(
                visible: selectedFile != null && selectedFile!.path.isNotEmpty,
                child: InkWell(
                  onTap: () {
                    setShowOPtion(true);
                  },
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.mainBlueColor,
                    child: Icon(Icons.edit, size: 10),
                  ),
                )),
            SizedBox(
              height: screenWidth(24),
            ),
            Visibility(
              visible: showOptions,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                CustomButton(
                text: "camera",
                  width: screenWidth(4),

                onPressed: () {
                  pickFile(FileType.CAMERA)
                      .then((value) => selectedFile = value);
                },
              ),
              CustomButton(
                text: "Gallery",
                width: screenWidth(4),
                onPressed: () {
                  pickFile(FileType.GALLERY)
                      .then((value) => selectedFile = value);
                },
              ),
              CustomButton(
                  text: "File",
                width: screenWidth(4),

                  onPressed: () {
            pickFile(FileType.FILE)
                .then((value) => selectedFile = value);
            },
            ),
          ],
          ),
        ),
        SizedBox(
          height: screenWidth(5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(15)),
          child: InkWell(
            onTap: () => Get.to(NotificationView()),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 2,
                      color: AppColors.buttoncolor,
                    ),
                    CustomText(
                      text: "   المعلومات الشخصية",color: AppColors.buttoncolor,
                      size: screenWidth(22),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.only(start: screenWidth(2.3)),
                      child: SvgPicture.asset("assets/all/ic_edit.svg"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenWidth(15),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(15)),
          child: InkWell(
            onTap: () => Get.to(HomeView()),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 2,
                  color: AppColors.mainBlueColor,
                ),
                CustomText(
                  text: "  ارسال شكاوي",
                  size: screenWidth(22),
                  color: AppColors.mainBlueColor,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(1.8)),
                  child: SvgPicture.asset(
                    "assets/all/ic_send_feedback.svg",
                    color: AppColors.mainBlueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenWidth(15),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(15)),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 2,
                  color: AppColors.mainTextColor,
                ),
                CustomText(
                  text: "  عن التطبيق",
                  size: screenWidth(22),
                  color: AppColors.mainTextColor,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: screenWidth(1.7)),
                  child: SvgPicture.asset("assets/all/details.svg"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenWidth(15),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(15)),
          child: CustomButton(text: "تسجيل خروج", onPressed: () {}),
        )
        ]),
    ));
  }
  void setShowOPtion(bool value) {
    setState(() {
      showOptions = value;
    });
  }

  Future<FileModel> pickFile(FileType type) async {
    String path = '';

    switch (type) {
      case FileType.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOPtion(false);
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }
}

class FileModel {
  FileType type;
  String path;

  FileModel(this.path, this.type);
}

enum FileType { CAMERA, GALLERY, FILE }