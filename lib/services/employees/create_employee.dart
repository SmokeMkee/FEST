import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateEmployee extends StatefulWidget {
  const CreateEmployee({Key? key}) : super(key: key);

  @override
  _CreateEmployeeState createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  final borderRaduis = BorderRadius.all(Radius.circular(15));

  String role = 'Обычный пользователь';

  List<String> roles = <String>['Обычный пользователь', 'Администратор', 'Модератор' , 'Глава департамента', 'Менеджер Департамента'];
  List<TextEditingController> controllers = <TextEditingController>[];

  @override
  void initState() {
    // TODO: implement initState
    controllers.add(TextEditingController());
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
                          'Новый сотрудник',
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
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                    labelText: "ФИО",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                    labelText: "Электронная почта",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                    labelText: "Номер телефона",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: "Роль",
                              labelStyle: TextStyle(fontSize: 20),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Name"),
                        value: role,
                          items: roles.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(), onChanged: (String? newValue){
                        setState(() {
                          role = newValue!;
                        });
                      }),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.help, size: 32, color: Color.fromRGBO(66, 104, 124, 1),)
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controllers.length,
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
                                  labelText: "Должность №" + (index + 1).toString(),
                                  labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    controllers.removeAt(index);
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
                                  "Добавить должность",
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
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                    labelText: "Департамент",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey),
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
