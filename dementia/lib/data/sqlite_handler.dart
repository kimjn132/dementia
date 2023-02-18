import 'package:dementia/data/todo_list.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'todolist.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table todolist(id integer primary key autoincrement, info text, date1 text, date2 text, ampm text, hour integer, minute integer)");
      },
      version: 1,
    );
  }

  Future<int> insertTodolist(TodoList todolist) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into todolist(info, date1, date2, ampm, hour, minute) values (?,?,?,?,?,?)',
        [todolist.info, todolist.date1, todolist.date2, todolist.ampm, todolist.hour, todolist.minute]);
    return result;
  }

  // Future<int> insertStudents(List<Students> students) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   for (var student in students) {
  //     result = await db.rawInsert(
  //         'insert into students(code, name, dept, phone) values (?,?,?,?)',
  //         [student.code, student.name, student.dept, student.phone]);
  //   }
  //   return result;
  // }

  Future<List<TodoList>> queryTodolist() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from todolist');
    return queryResult.map((e) => TodoList.fromMap(e)).toList();
  }

  Future<void> deleteTodolist(int id) async {
    final Database db = await initializeDB();
    await db.rawDelete('delete from todolist where id = ?', [id]);
  }

  Future<int> updateTodolist(TodoList todoList) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
        'update todolist set info = ?, date1 = ?, date2 = ?, ampm = ?, hour = ?, minute = ? where id = ?',
        [todoList.info, todoList.date1, todoList.date2, todoList.ampm, todoList.hour, todoList.minute, todoList.id]);
    return 0;
  }

  // Future<int> updateStudents(List<Students> students) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   for (var student in students) {
  //     result = await db.rawUpdate(
  //         'update students set name = ?, dept = ?, phone = ? where code = ?',
  //         [student.name, student.dept, student.phone, student.code]);
  //   }
  //   return result;
  // }
} // DatabaseHandler
