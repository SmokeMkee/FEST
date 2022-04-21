import 'package:flutter/material.dart';
import 'package:itfest/services/applications/MakeApplication.dart';
import 'package:itfest/services/applications/applications_list.dart';
import 'package:itfest/services/applications/create_application_pattern.dart';
import 'package:itfest/services/attendance/attendance.dart';
import 'package:itfest/services/employees/create_employee.dart';
import 'package:itfest/services/employees/employees.dart';
import 'package:itfest/profile/profile.dart';
import 'package:itfest/tasks/create_task.dart';

import 'chat/swap_chat.dart';
import 'init.dart';
import 'login/login.dart';
import 'nav_bar/navigation_bar.dart';
import 'news/add_news.dart';
import 'news/news_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          FocusScope.of(context).requestFocus(new FocusNode());
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blue,
            showUnselectedLabels: true,
            selectedItemColor: Color.fromRGBO(68, 167, 184, 1),
            unselectedItemColor: Color.fromRGBO(144, 153, 170, 1),
            unselectedLabelStyle: TextStyle(color:Color.fromRGBO(144, 153, 170, 1) ),
            selectedLabelStyle:TextStyle(color:Color.fromRGBO(144, 153, 170, 1) ) ,

          )
        ),
        routes: {

          '/init': (context) => Initialize(),
          '/auth' : (context)  => LoginForm(),
          '/main_screen' : (context) => NavBar(),
          '/main_screen/movie_details' : (context) {
          final arguments =  ModalRoute.of(context)!.settings.arguments;
          if(arguments is int){
            return NewsDetails(id: arguments);
          }else{
            return NewsDetails(id: 0,);
          }

          },
          '/main_screen/add_news' : (context) => add_news(),
          '/main_screen/applications' : (context) => ApplicationsList(),
          '/main_screen/attendance' : (context) => Attendance(),
          '/main_screen/employees': (context) => Employees(),
          '/main_screen/create_application_pattern': (context) => CreateApplicationPattern(),
          '/main_screen/create_employee': (context) => CreateEmployee(),
          '/main_screen/create_task': (context) => CreateTask(),
          "/main_screen/application_details": (context) => MakeApplication(ModalRoute.of(context)!.settings.arguments as int),
          "/main_screen/swap_cahts" : (context) => SwapChatWidget()
        },
          initialRoute:'/init',

      ),
    );
  }
}
