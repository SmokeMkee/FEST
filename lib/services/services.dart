
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final InputBorder = OutlineInputBorder(
      borderSide:
      BorderSide(color: Color.fromRGBO(232, 232, 232, 1), width: 2),
      borderRadius: BorderRadius.circular(100));

  final search_controller = TextEditingController();

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
                        'Организация',
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  controller: search_controller,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                      border: InputBorder,
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        fontSize: 17,
                      ),
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 20),
                      enabledBorder: InputBorder,
                      focusedBorder: InputBorder),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                child: Row(
                  children: [
                    Text("Сервисы", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), textAlign: TextAlign.start,),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/main_screen/applications' );
                    },
                    child: Column(
                      children: [
                        Container(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          child: SvgPicture.asset("assets/applications_icon.svg", width: 32, height: 32,),
                        ), decoration: BoxDecoration(color: Color.fromARGB(255, 217, 226, 231), borderRadius: BorderRadius.all(Radius.circular(15))),),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Заявления", style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  )),
                  Expanded(child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/main_screen/employees' );
                    },
                    child: Column(
                      children: [
                        Container(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            child: SvgPicture.asset("assets/employees_icon.svg", width: 32, height: 32,),
                        ), decoration: BoxDecoration(color: Color.fromARGB(255, 217, 226, 231), borderRadius: BorderRadius.all(Radius.circular(15))),),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Сотрудники", style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  )),
                  Expanded(child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/main_screen/attendance');
                    },
                    child: Column(
                      children: [
                        Container(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 21),
                          child: SvgPicture.asset("assets/attendance_icon.svg", width: 30, height: 30,),
                        ), decoration: BoxDecoration(color: Color.fromARGB(255, 217, 226, 231), borderRadius: BorderRadius.all(Radius.circular(15))),),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Посещаемость", style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
