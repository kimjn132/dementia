import 'package:dementia/data/sqlite_handler.dart';
import 'package:flutter/material.dart';


class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    //getJsonData();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("투약정보"),
      ),

  //     String info;
  // final String date1;
  // final String date2;
  // final String ampm;
  // final int hour;
  // final int minute;
          body: FutureBuilder(
        future: handler.queryTodolist(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                     
                  child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: UniqueKey(),
                          // key: Key(snapshot.data![index].code
                          // ),
                          onDismissed: (direction) {
                            setState(() {
                              handler.deleteTodolist(snapshot.data![index].id);
                              //snapshot.data!.removeAt(index);
                            });
                          },
                          background: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.save,
              size: 36,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              size: 36,
              color: Colors.white,
            ),
          ),
                          child: Card(
                            child: Column(
                              //READ
                              children: [
                                Row(
                                  children: [
                                    const Text('투약정보 : '),
                                    Text(snapshot.data![index].info)
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('투약기간 : '),
                                    Text("${snapshot.data![index].date1}  -  ${snapshot.data![index].date2}")
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('투약시간 : '),
                                    Text("${snapshot.data![index].ampm} ${snapshot.data![index].hour}시 ${snapshot.data![index].hour}분")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                );
                
              });
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}