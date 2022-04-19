import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class add_news extends StatefulWidget {
  const add_news({Key? key}) : super(key: key);

  @override
  _add_newsState createState() => _add_newsState();
}

class _add_newsState extends State<add_news> {
  @override
  Widget build(BuildContext context) {
    final input_border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Color.fromRGBO(216, 224, 228, 1),

        )

    );
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.0), // here the desired height
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
                        'Создать новость',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ],
              ),
            )),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: input_border,
                  focusedBorder: input_border,
                  labelText: 'Заголовок',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(66, 104, 124, 1)
                  ),
                  border: input_border
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: input_border,
                  focusedBorder: input_border,
                  labelText: 'Описание',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(66, 104, 124, 1)
                  ),
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 5,
              )

            ],
          ),
        ),
      ),
    );
  }
}
