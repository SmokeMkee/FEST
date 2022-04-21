import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:itfest/api_controllers/account_controller.dart';
import 'package:itfest/api_controllers/department_controller.dart';
import 'package:itfest/api_controllers/task_controller.dart';
import 'package:itfest/entities/User.dart';
import 'package:itfest/enums/CustomColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String? _range;

  String? _selectedDate = "";

  String? _dateCount;
  String? _rangeCount;

  bool selectDate = false;

  User? user;

  List<User> users = [];

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = DateFormat('yyyy-MM-dd').format(args.value);
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
      setState(() {
        selectDate = false;
      });
    });
  }

  final borderRaduis = BorderRadius.all(Radius.circular(15));

  String department = 'Бухгалтерия';

  List<String> departments = <String>[];
  List<TextEditingController> controllers = <TextEditingController>[];

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    DepartmentController.get().then((value) {
      setState(() {
        var list = value as List;

        for(int i = 0; i < list.length; i++){
          if(list[i]['name'] == "organization"){
            departments.add("Для целой организации");
            continue;
          }
          departments.add(list[i]['name']);
        }
        department = "Для целой организации";
      });
    });

    AccountController.getAll().then((value) {
      print(value.data);
      print(value.statusCode);

      setState(() {
        for(int i = 0; i < value.data.length; i++){
          users.add(User(value.data[i]['id'], value.data[i]['name'], value.data[i]['email'], value.data[i]['department'], [], "", DateTime.now()));
        }
      });
    });

    controllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
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
                      'Новая задача',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
                  ],
                ),
              ),
            )),
        body: Stack(children: [
          if (selectDate) ...[
            Positioned(
              top: 50,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: CustomColors.colors['dark-blue']!),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 400,
                width: MediaQuery.of(context).size.width - 40,
                child: SfDateRangePicker(
                  backgroundColor: Colors.white,
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
              ),
            ),
            Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      selectDate = false;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.redAccent,
                  ),
                )),
          ] else ...[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: borderRaduis),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 224, 228))),
                        labelText: "Название задачи",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: description,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: borderRaduis),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 224, 228))),
                        labelText: "Описание",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("Дедлайн", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600), textAlign: TextAlign.start,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 216, 224, 228),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectDate = true;
                          });
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
                                    ((_selectedDate == "" || _selectedDate == null) ? "гггг/мм/дд" : _selectedDate!),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 66, 104, 124),
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
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "Департамент",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(15.0),
                            ),
                          ),
                        ),
                        value: department,
                        items: departments.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(), onChanged: (String? newValue){
                      setState(() {
                        department = newValue!;
                      });
                    }),


                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: "Сотрудник",
                                labelStyle: TextStyle(fontSize: 20),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                filled: true,
                              ),
                              value: user,
                              items: users.map<DropdownMenuItem<User>>(
                                      (User value) {
                                    return DropdownMenuItem<User>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Image.network("https://img.icons8.com/ios-filled/50/000000/cat-profile.png", width: 64,),
                                          Text(value.fullName!),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (User? newValue) {
                                setState(() {
                                  user = newValue!;
                                });
                              }),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 66, 104, 124),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextButton(
                          onPressed: () async {

                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            try{
                              var requestBody = {
                                "name": name.text,
                                "description": description.text,
                                "deadline": _selectedDate! + "T00:00:00",
                                "userId": user?.id,
                                "departmentName": (department == "Для целой организации" ? "organization" : department)
                            };

                              print(requestBody);

                              TaskController.create(
                                  requestBody, prefs.getString("accessToken")!);
                            } catch(e){
                              print(e);
                            }

                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: Text(
                                      "Создать задачу",
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
            ),
          ]
        ]));
  }
}
