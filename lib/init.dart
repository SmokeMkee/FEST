import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/api_controllers/enterprise_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Initialize extends StatefulWidget {
  const Initialize({Key? key}) : super(key: key);

  @override
  State<Initialize> createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {

  int statusCode = 0;

  @override
  void initState() {

    Future<SharedPreferences> prefs = SharedPreferences.getInstance();

    prefs.then((value) {
      value.clear();
    });

    EnterpriseController.isInitialized().then((value) {
      if(value == 200){
        statusCode = 200;
        Navigator.of(context).pushReplacementNamed("/auth");
      } else {
        statusCode = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController adminEmail = TextEditingController();
    TextEditingController accountingEmail = TextEditingController();
    TextEditingController technicalSupportEmail = TextEditingController();

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
                height: 40,
              ),
              SvgPicture.asset('assets/logo.svg'),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Создать организацию' , style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(66, 104, 124, 1)
                      ),),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: adminEmail,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                    filled: true,
                    hintText: 'e-mail системного администратора',
                    enabledBorder: InputBorder,
                    focusedBorder: InputBorder),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: accountingEmail,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                    filled: true,
                    hintText: 'e-mail бухгалтерии',
                    enabledBorder: InputBorder,
                    focusedBorder: InputBorder),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: technicalSupportEmail,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                    filled: true,
                    hintText: 'e-mail технической поддержки',
                    enabledBorder: InputBorder,
                    focusedBorder: InputBorder),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          EnterpriseController.initialize(adminEmail.text, accountingEmail.text, technicalSupportEmail.text);
                          print(adminEmail.text);
                          print(accountingEmail.text);
                          print(technicalSupportEmail.text);
                        },
                        child: Text(
                          'Создать',
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
                'Возникли проблемы?',
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
