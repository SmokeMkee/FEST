import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itfest/api_controllers/account_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  void initState() {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    _prefs.then((value) {
      if(value.getKeys().contains('accessToken')){
        Navigator.of(context).pushReplacementNamed('/main_screen');
      }
    });

    super.initState();
  }

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
                    padding: const EdgeInsets.all(15.0),
                    child: Text('ВХОД' , style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(66, 104, 124, 1)
                    ),),
                  ),
                ],
              ),
              TextField(
                controller: email,
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
                controller: password,
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
                      AccountController.login(email.text, password.text).then((value) {
                        if(value == 200){
                          Navigator.of(context).pushReplacementNamed('/main_screen');
                        }
                      });

                      // Navigator.of(context).pushReplacementNamed('/main_screen');
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
