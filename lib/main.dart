import 'package:flutter/material.dart';

import 'login/login.dart';
import 'nav_bar/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
        '/main_screen' : (context) => NavBar()
      },
        initialRoute:'/auth' ,

    );
  }
}
