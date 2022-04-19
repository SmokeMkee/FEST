import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(232, 232, 232, 1), width: 2),
        borderRadius: BorderRadius.circular(100));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0), // here the desired height
        child: AppBar(
            backgroundColor: Color.fromRGBO(66, 104, 124, 1),
            title: Align(
              child: Text(
                'Вход',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 35),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                    filled: true,
                    hintText: 'Введите e-mail',
                    enabledBorder: InputBorder,
                    focusedBorder: InputBorder),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    filled: true,
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(Icons.vpn_key_outlined,
                        color: Color.fromRGBO(189, 189, 189, 1)),
                    hintText: 'Введите e-mail',
                    enabledBorder: InputBorder,
                    focusedBorder: InputBorder),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Забыли пароль?',
                style: TextStyle(
                  color: Color.fromRGBO(66, 104, 124, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/main_screen');
                    },
                    child: Text(
                      'ВОЙТИ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: Color.fromRGBO(66, 104, 124, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
