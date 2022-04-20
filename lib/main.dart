import 'package:flutter/material.dart';
import 'package:itfest/profile/profile.dart';

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
    return MaterialApp(
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

      },
        initialRoute:'/auth' ,

    );
  }
}
