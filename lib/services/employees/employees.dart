import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/api_controllers/account_controller.dart';
import 'package:itfest/enums/CustomColors.dart';

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  List employees = [];

  @override
  void initState() {

    AccountController.getAll().then((value) {
      print(value.data);

      setState(() {
        for(int i = 0; i < value.data.length; i++){
          employees.add(value.data[i]);
        }
      });
    });

    super.initState();
  }
  List chatUsers = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6eXk0IwHSiexF2ciMnRXDzc3TpYPqCYeofg&usqp=CAU",
      "https://images11.cosmopolitan.ru/upload/img_cache/12d/12d2e3af103da435cacaaa25d60d26cc_cropped_550x740.jpg",
      "https://avatanplus.com/files/photos/original/590ec8ec7139115be1c0dbb0.jpg",
     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnlwDwZoELDkLhCciJCWjcMesI08GR-YVPQw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUyjMowxdddDUMXbCx_GSjxEc7d_k58g_4Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUyjMowxdddDUMXbCx_GSjxEc7d_k58g_4Q&usqp=CAU"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
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
                          'Сотрудники',
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
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 216, 224, 228),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/main_screen/create_employee");
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 15),
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
                            child: Text(
                              "Добавить сотрудника",
                              style: TextStyle(
                                color: Color.fromARGB(255, 66, 104, 124),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  child: Row(
                    children: [

                      Text(
                        "Сотрудники компании",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: employees.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(chatUsers[index]),
                                      maxRadius: 30,
                                    ),
                                    SizedBox(width: 16,),
                                    Expanded(
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Expanded(child: Text(employees[index]['name'], style: TextStyle(fontSize: 18),)),
                                                Text(employees[index]['departmentName'], style: TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                            SizedBox(height: 6,),
                                            Text(employees[index]['email'],style: TextStyle(fontSize: 13,color: Colors.grey.shade600, ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
