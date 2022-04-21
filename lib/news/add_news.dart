import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itfest/api_controllers/department_controller.dart';
import 'dart:io';

import 'package:itfest/api_controllers/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class add_news extends StatefulWidget {
  const add_news({Key? key}) : super(key: key);

  @override
  _add_newsState createState() => _add_newsState();
}
String imageBase64 = "";
String imageFormat = "jpg";
String departs = "s";

class _add_newsState extends State<add_news> {


  final borderRaduis = BorderRadius.all(Radius.circular(15));
  List<TextEditingController> controllers = <TextEditingController>[];
  String? department = "";
  List<String> departments = [];

  @override
  void initState() {
    DepartmentController.get().then((value) {
      setState(() {
        var list = value as List;

        for(int i = 0; i < list.length; i++){
          if(list[i]['name'] == "organization"){
            departments.add("Для целой организации");
            continue;
          }
          departments.add(list[i]['name']);
        }
        department = "Для целой организации";
      });
    });
  }
  // @override
  // void initState() {
  //   DepartmentController.get().then((value) {
  //     setState(() {
  //       var list = value as List;
  //
  //       for(int i = 0; i < list.length; i++){
  //         if(list[i]['name'] == "organization"){
  //           departments.add("Для целой организации");
  //           continue;
  //         }
  //         departments.add(list[i]['name']);
  //       }
  //       department = "Для целой организации";
  //     });
  //   });
  //
  //   // TODO: implement initState
  //   controllers.add(TextEditingController());
  //
  // }


  TextEditingController title =TextEditingController();
  TextEditingController description =TextEditingController();







  @override
  Widget build(BuildContext context) {


    final input_border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Color.fromRGBO(216, 224, 228, 1),
        ));
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height
          child: AppBar(
            backgroundColor: Color.fromRGBO(66, 104, 124, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  'Создать новость',
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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image_picker(),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: input_border,
                    focusedBorder: input_border,
                    labelText: 'Заголовок',
                    labelStyle: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(66, 104, 124, 1)),
                    border: input_border),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: description,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: input_border,
                  focusedBorder: input_border,
                  labelText: 'Описание',
                  labelStyle: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(66, 104, 124, 1)),
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 5,
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Департамент",
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(15.0),
                      ),
                    ),
                  ),
                  value: department,
                  items: departments.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged: (String? newValue){
                setState(() {
                  department = newValue;
                  departs=department!;
                });
              }),
              SizedBox(height: 40,),
              bottom_button_profile_quit('Выйти' , title.text , description.text , departs),
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
    print('s');
    print(photo.path);
    File imagefile = File(photo.path); //convert Path to File
    Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
    imageBase64 = base64.encode(imagebytes); //convert bytes to base64 string
    final tempImage = File(photo.path);
    setState(() {
      pickedImage = tempImage;
    });
  }

  String imagePath = '';
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 305,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(216, 224, 228, 1), width: 3),
              borderRadius: BorderRadius.circular(8)),
          child: IconButton(
              onPressed: () async {
                pickImages(
                  ImageSource.gallery,

                );

              },
              icon: pickedImage != null
                  ? Image.file(pickedImage! , fit: BoxFit.cover ,)
                  : SvgPicture.asset(
                      'assets/addphoto.svg',
                      fit: BoxFit.cover,
                      width: 140,
                      height: 140,
                    )),
        ),
      ],
    );
  }
}

class bottom_button_profile_quit extends StatelessWidget {
  String text = "";
  String title = "";
  String description = "";
  String department = "";
  bottom_button_profile_quit(this.text, this.title, this.description, this.department, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {

              SharedPreferences prefs = await SharedPreferences.getInstance();
              try {
                NewsController.news(
                    {
                      "title": title,
                      "content" : description,
                      "departmentName" : department,
                      "images" : [{
                    "format" : 'jpg',
                    "imageData" : imageBase64,
                    }]
                    }, prefs.getString('accessToken')!).then((value) {
                  if(value == 200){
                    Navigator.pop(context);
                  }
                });
              } catch(e){

              }


            },
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
