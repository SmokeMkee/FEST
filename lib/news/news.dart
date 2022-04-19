import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
        borderSide:
        BorderSide(color: Color.fromRGBO(232, 232, 232, 1), width: 2),
        borderRadius: BorderRadius.circular(100));

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0), // here the desired height
          child: AppBar(
            backgroundColor: Color.fromRGBO(66, 104, 124, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                    child: Text(
                  'Новости',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
                SvgPicture.asset('assets/add.svg')
              ],
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search , size: 30, color: Color.fromRGBO(189, 189, 189, 1),),
                    border: InputBorder,
                    hintText: 'Поиск',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(189,189,189,1),
                        fontSize: 17,
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      enabledBorder: InputBorder,
                      focusedBorder: InputBorder
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
