import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itfest/api_controllers/request_controller.dart';

class MakeApplication extends StatefulWidget {

  MakeApplication(this.id);

  int id = 0;

  @override
  _MakeApplicationState createState() => _MakeApplicationState();

}

class _MakeApplicationState extends State<MakeApplication> {
  final borderRaduis = BorderRadius.all(Radius.circular(15));

  final TextEditingController addresserController = TextEditingController();
  String PatternName = "";
  List items = [];
  List<TextEditingController> controllers = <TextEditingController>[];

  TextEditingController name = TextEditingController();


  @override
  void initState() {
    addresserController.text = "Адресат заявления";
    
    RequestController.getById(widget.id).then((value) {
      setState(() {
        items = value['fields'];
        name.text = value['name'];
        PatternName = value['name'];
        for(int i = 0; i < items.length; i++){
          controllers.add(TextEditingController());
        }
        print(items);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
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
                          'Заполнить заявление',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                      labelText: "Название заявления",
                      labelStyle: TextStyle(fontSize: 24, color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return  Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controllers[index],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: borderRaduis),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 216, 224, 228))),
                                labelText: items[index]['name'],
                                labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 66, 104, 124),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextButton(
                      onPressed: () async {

                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  "Отправить заявление",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
