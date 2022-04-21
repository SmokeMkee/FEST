import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/news/add_news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height
          child: AppBar(
            backgroundColor: Color.fromRGBO(66, 104, 124, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                    child: Text(
                      'Профиль',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),

              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              image_picker(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Divider(height: 5,),
                    SizedBox(height: 10),
                    Text(
                      'ДАННЫЕ АККАУНТА',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(96, 96, 96, 1)),
                    ),
                    button_constructor('assets/personal-information.svg',
                        'Личная информация', 'assets/arrow_profile.svg'),
                    button_constructor('assets/theme-profile.svg',
                        'Внешний вид', 'assets/arrow_profile.svg'),
                    button_constructor('assets/push_profile.svg',
                        'Push - уведомления ', 'assets/arrow_profile.svg'),
                    SizedBox(height: 15),
                    Divider(height: 5,),
                    SizedBox(height: 15),
                    Text(
                      'ДОПОЛНИТЕЛЬНО',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(96, 96, 96, 1)),
                    ),
                    button_constructor('assets/help-profile.svg',
                        'Помощь', 'assets/arrow_profile.svg'),
                    button_constructor('assets/privacy-policy.svg',
                        'Политика конфиденциальности', 'assets/arrow_profile.svg'),
                    button_constructor('assets/terms-of-use.svg',
                        'Условия использования ', 'assets/arrow_profile.svg'),
                    SizedBox(
                      height: 40,
                    ),
                    bottom_button_profile_quit('Выйти'),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class image_picker extends StatefulWidget {
  const image_picker({Key? key}) : super(key: key);

  @override
  _image_pickerState createState() => _image_pickerState();
}

class _image_pickerState extends State<image_picker> {
  File? pickedImage;



  pickImages(ImageSource image) async {
    final photo = await ImagePicker().pickImage(source: image);
    if (photo == null) {
      return;
    }
    File imagefile = File(photo.path); //convert Path to File
    Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
    imageBase64 = base64.encode(imagebytes);


    final tempImage = File(photo.path);
    setState(() {
      pickedImage = tempImage;
    });
  }

  String imagePath = '';
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: ()  {

                pickImages(
                  ImageSource.gallery,
                );
              },
              icon: pickedImage != null
                  ? CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 40,
                  child: CircleAvatar(
                    radius: 39,
                    backgroundImage: Image.file(
                      pickedImage!,
                      fit: BoxFit.cover,
                    ).image,
                  ))
                  : SvgPicture.asset(
                'assets/photo-profile.svg',
                fit: BoxFit.cover,
                width: 100,
                height: 100,

              )),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Азиз Маратович',
                style: TextStyle(fontSize: 19 , color: Color.fromRGBO(66, 104, 124, 1) , fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 5),
              Text(
                'Алматинская обл., г. Алматы',
                style: TextStyle(fontSize: 13 , color: Color.fromRGBO(66, 104, 124, 0.8)),
              ),
              SizedBox(height: 5),
              Text(
                '+7 (777) 123 23 23',
                style: TextStyle(color: Color.fromRGBO(66, 104, 124, 0.6), fontSize: 14 , ),
              )
            ],
          ),
        )
      ],
    );
  }
}





class button_constructor extends StatelessWidget {
  String lefticon = "";
  String text = "";
  String righticon = "";

  button_constructor(String lefticon, String text, String righticon) {
    this.lefticon = lefticon;
    this.text = text;
    this.righticon = righticon;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              SvgPicture.asset(
                lefticon,
                color: Color.fromRGBO(66, 104, 124, 1),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Color.fromRGBO(66, 104, 124, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              SvgPicture.asset(righticon , color: Color.fromRGBO(66, 104, 124, 1),),
            ],
          ),
        ),

      ],
    );
  }
}


class bottom_button_profile_quit extends StatelessWidget {
  String text = '';
  bottom_button_profile_quit(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(66, 104, 124, 1),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(19), top: Radius.circular(19)),
                  ),
                )),
          ),
        ),
      ]),
    );
  }
}