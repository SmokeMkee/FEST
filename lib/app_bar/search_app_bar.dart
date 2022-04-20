import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
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
                IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp, size: 32)),
                Expanded(
                    child: Text(
                      'Организация',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),

              ],
            ),
          ),
        ));
  }
}
