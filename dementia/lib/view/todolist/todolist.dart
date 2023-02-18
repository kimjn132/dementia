import 'package:dementia/data/sqlite_handler.dart';
import 'package:dementia/data/todo_list.dart';
import 'package:dementia/view/todolist/todolist_add.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('치매 예방을 위한 활동'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              //const Text('치매예방을 위한 활동을 기록하고 실천해보세요.'),
              bringList(),
            ],
          ),
        ),
        floatingActionButton: floatbtn());
  } //Build

// -------------Widget ----------------

  Widget floatbtn() {
    return FloatingActionButton(
      backgroundColor: Colors.amber,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const TodolistAddPage();
        })).then((value) => reloadData());
      },
      child: const Icon(Icons.add),
    );
  }

//db todolist 불러오기
  void reloadData() {
    setState(() {
      handler.queryTodolist();
    });
  }

// db에서 todolist 불러온 것 출력해주기

  Widget bringList() {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: FutureBuilder(
          future: handler.queryTodolist(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TodoList>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.delete_forever),
                        ),
                        key: ValueKey<int>(snapshot.data![index].id!),
                        onDismissed: (DismissDirection direction) async {
                          await handler
                              .deleteTodolist(snapshot.data![index].id!);
                          setState(() {
                            snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3)),
                                ]),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Info : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index].info)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "시작 날짜 : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index].date1)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "마지막 날짜 : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index].date2)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "시간 : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "${snapshot.data![index].ampm} ${snapshot.data![index].hour}시 ${snapshot.data![index].minute}분")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // onTap: () {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) {
                          //     return UpdateStudents(
                          //         rcode: snapshot.data![index].code,
                          //         rname: snapshot.data![index].name,
                          //         rdept: snapshot.data![index].dept,
                          //         rphone: snapshot.data![index].phone);
                          //   })).then((value) => reloadData());
                          // },
                        ));
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}//END