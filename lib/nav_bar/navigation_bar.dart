import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../news/list_news.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static  List<Widget> _widgetOptions = <Widget>[
    ListNews(),
    Text(
      'Index 1: Услуги',

    ),
    Text(
      'Index 2: Задачи',

    ),
    Text(
      'Чат'
    ),
    Text('Профиль')
  ];
  
  int _selectedPage = 0;

  void onSelectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon:  Padding(padding: EdgeInsets.all(5),child: SvgPicture.asset('assets/news.svg')),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
              icon: Padding( padding: EdgeInsets.all(5),child: SvgPicture.asset('assets/uslugi.svg' , width: 24, height: 24,)), label: 'Услуги'),
          BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.all(5), child: SvgPicture.asset('assets/tasks.svg')), label: 'Задачи'),
          BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.all(5),child: SvgPicture.asset('assets/message.svg')), label: 'Чат'),
          BottomNavigationBarItem(
            icon: Padding(padding: EdgeInsets.all(5),child: SvgPicture.asset('assets/profile.svg')),
            label: 'Профиль',
          ),
        ],
        onTap: onSelectPage,
      ),
    );
  }
}
