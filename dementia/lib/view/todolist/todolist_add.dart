import 'package:dementia/data/sqlite_handler.dart';
import 'package:dementia/data/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TodolistAddPage extends StatefulWidget {
  const TodolistAddPage({super.key});

  @override
  State<TodolistAddPage> createState() => _TodolistAddPageState();
}

class _TodolistAddPageState extends State<TodolistAddPage> {
  TextEditingController infoController = TextEditingController();
  final DateRangePickerController datePickController =
      DateRangePickerController();
  DateTime? createDate;
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  late List<int> hourList;
  late List<int> minuteList;
  late List<String> ampmList;

  late DatabaseHandler handler;

  //sqlite
  late String info;
  late String date1;
  late String date2;
  late String ampm;
  late int hour;
  late int minute;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoController = TextEditingController();
    dateController1 = TextEditingController();
    dateController2 = TextEditingController();
    hourList = [];
    minuteList = [];


    handler = DatabaseHandler();

    for (int i = 1; i <= 12; i++) {
      hourList.add(i);
    }
    for (int i = 0; i <= 59; i++) {
      minuteList.add(i);
    }

    ampmList = ['오전', '오후'];

    info = "";
    date1 = "";
    date2 = "";
    ampm = "";
    hour = 0;
    minute = 0;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('할일 추가하기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('투약중인 약에 대한 원하는 정보를 기입하세요.'),
                ],
              ),
              TextField(
                controller: infoController,
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: TextField(
                      readOnly: true,
                      controller: dateController1,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_month),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue))),
                      onTap: () async {
                        _selectDate1(context);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("~"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: TextField(
                      readOnly: true,
                      controller: dateController2,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_month),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue))),
                      onTap: () async {
                        _selectDate2(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              medication(),
              add_btn()
            ],
          ),
        ),
      ),
    );
  } //build

  // ---------------Widget---------------

//투약 날짜 1
  _selectDate1()  {
    MaterialButton(
    color: Colors.deepOrangeAccent,
    onPressed: () async {
      final List<DateTime> picked = await SfDateRangePicker.showDatePicker(
          context: context,
          initialFirstDate: new DateTime.now(),
          initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
          firstDate: new DateTime(2015),
          lastDate: new DateTime(DateTime.now().year + 2)
      );
      if (picked != null && picked.length == 2) {
          print(picked);
      }
    },
    child: new Text("Pick date range")
)
  }

  //투약 날짜2
  _selectDate2(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        dateController2.text =
            formattedDate; //set output date to TextField value.
      });
    } else {}
  }

//투약 시간
  Widget medication() {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.schedule),
                // labelText: '오전',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            items: ampmList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                ampmList[0];
                print(val);
              });
            },
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.08,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
              labelText: '시',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          items: hourList.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              print(val);
            });
          },
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          " : ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.08,
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
              labelText: '분',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          items: minuteList.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              //
            });
          },
        ),
      ),
    ]);
  } //

  Widget add_btn() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.05,
        child: ElevatedButton(
            onPressed: () async {
              // Navigator.of(context).pop();
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const TodoListPage();
              //   //id, password 같이 보내주기(from _showDialog)
              // }));
              // info = codeController.text.toString();
              //           name = nameController.text.toString();
              //           dept = deptController.text.toString();
              //           phone = phoneController.text.toString();
              //           Students students = Students(
              //               code: code, name: name, dept: dept, phone: phone);
              //           // List<Students> listOfStudetns = [students];
              //           await handler.insertStudents(students);
              info = infoController.text;
              date1 = dateController1.text;
              date2 = dateController2.text;
              ampm = ampmList.last;
              hour = hourList.last;
              minute = minuteList.last;

              TodoList todolist = TodoList(info: info, date1: date1, date2: date2, ampm: ampm, hour: hour, minute: minute);
              await handler.insertTodolist(todolist);


              _showDialog(context);
            },
            child: const Text('추가')),
      ),
    );
  } //add_btn

} //end

_showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("입력 결과"),
          content: const Text("입력이 완료 되었습니다."),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context); // Main화면으로 이동
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}//_showdialog
