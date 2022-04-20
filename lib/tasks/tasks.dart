import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/app_bar/app_bar.dart';
import 'package:itfest/enums/CustomColors.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: AppBar(
              backgroundColor: CustomColors.colors['dark-blue'],
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
                      'Задачи',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                    IconButton(onPressed: (){
                      Navigator.of(context).pushNamed("/main_screen/create_task");

                    }, icon: SvgPicture.asset('assets/add.svg'))
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selected = 1;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: SvgPicture.asset(
                                  "assets/open_task_icon.svg",
                                  width: 32,
                                  height: 32,
                                  color: selected == 1 ? CustomColors.colors['light-blue'] : CustomColors.colors['dark-blue']
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: selected == 1
                                      ? CustomColors.colors['dark-blue']
                                      : CustomColors.colors['light-blue'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Открытые",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selected = 2;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: SvgPicture.asset(
                                  "assets/in_process_icon.svg",
                                  width: 32,
                                  height: 32,
                                  color: selected == 2 ? CustomColors.colors['light-blue'] : CustomColors.colors['dark-blue']
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: selected == 2
                                      ? CustomColors.colors['dark-blue']
                                      : CustomColors.colors['light-blue'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "В процессе",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selected = 3;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 11),
                                child: SvgPicture.asset(
                                  "assets/success_icon.svg",
                                  width: 30,
                                  height: 30,
                                  color: selected == 3 ? CustomColors.colors['light-blue'] : CustomColors.colors['dark-blue']
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: selected == 3
                                      ? CustomColors.colors['dark-blue']
                                      : CustomColors.colors['light-blue'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Завершенные",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
