import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/api_controllers/request_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationsList extends StatefulWidget {
  const ApplicationsList({Key? key}) : super(key: key);

  @override
  _ApplicationsListState createState() => _ApplicationsListState();
}

class _ApplicationsListState extends State<ApplicationsList> {
  List applications = [];

  @override
  void initState() {
    var response = RequestController.get("organization");

    response.then((value) {
      setState(() {
        applications = value;
      });
      super.initState();
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
                      'Заявления',
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
                      Navigator.of(context).pushNamed("/main_screen/create_application_pattern");
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
                              "Создать шаблон заявления",
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
                        "Написать заявление",
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
                    itemCount: applications.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 66, 104, 124),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, "/main_screen/application_details", arguments: applications[index]['id']);
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
                                        applications[index]['name'],
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
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
