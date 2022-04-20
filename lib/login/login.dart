import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(232, 232, 232, 1), width: 2),
        borderRadius: BorderRadius.circular(100));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(

            children: [
              SizedBox(
                height: 100,
              ),
              SvgPicture.asset('assets/logo.svg'),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Expanded(child: Text('ВХОД' , style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(66, 104, 124, 1)
                    ),)),
                  ),
                ],
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
                obscureText: true,
                decoration: InputDecoration(

                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    filled: true,
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(Icons.vpn_key_outlined,
                        color: Color.fromRGBO(189, 189, 189, 1)),
                    hintText: 'Введите пароль',
                    enabledBorder: InputBorder,
                    focusedBorder: InputBorder),
              ),
              SizedBox(
                height: 5,
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
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Забыли пароль?',
                style: TextStyle(
                  color: Color.fromRGBO(66, 104, 124, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
