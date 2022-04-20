import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/api_controllers/department_controller.dart';

class CreateApplicationPattern extends StatefulWidget {
  const CreateApplicationPattern({Key? key}) : super(key: key);

  @override
  _CreateApplicationPatternState createState() => _CreateApplicationPatternState();
}

class _CreateApplicationPatternState extends State<CreateApplicationPattern> {
  final borderRaduis = BorderRadius.all(Radius.circular(15));

  final TextEditingController addresserController = TextEditingController();

  List<String> items = <String>[];
  List<TextEditingController> controllers = <TextEditingController>[];

  TextEditingController name = TextEditingController();

  String? department = "";
  List<String> departments = [];

  @override
  void initState() {
    addresserController.text = "Адресат заявления";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: AppBar(
              backgroundColor: Color.fromRGBO(66, 104, 124, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          'Новый шаблон заявления',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                        labelText: "Название заявления",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
                    department = newValue!;
                  });
                }),
                SizedBox(height: 10,),
                Text("*Внутри какого департамента принята данная форма"),
                SizedBox(height: 20,),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Поля заявления",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controllers[index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                                  labelText: "Название поля №" + (index + 1).toString(),
                                  labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    controllers.removeAt(index);
                                    items.removeAt(index);
                                  });
                                },
                                child: SvgPicture.asset("assets/trash_icon.svg", width: 32, color: Color.fromARGB(255, 66, 104, 124),))
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 216, 224, 228),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextButton(
                      onPressed: () {
                        print("test");
                        setState(() {
                          items.add("");
                          controllers.add(TextEditingController());
                        });
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                              child: SvgPicture.asset(
                                "assets/add_icon.svg",
                                width: 32,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Text(
                                  "Добавить поле",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 66, 104, 124),
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 66, 104, 124),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextButton(
                      onPressed: () {
                        dynamic data = {};

                        data['name'] = name.text;

                        for(int i = 0; i < controllers.length; i++){
                          print(controllers[i].text);
                        }
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  "Опубликовать шаблон",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
