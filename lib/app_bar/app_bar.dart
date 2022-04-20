import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(String title, Key? key) : super(key: key) {
    this.title = title;
  }

  String title = "MCS";

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
                      title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }

}
