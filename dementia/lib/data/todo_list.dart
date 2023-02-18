class TodoList{
  final int? id;
  final String info;
  final String date1;
  final String date2;
  final String ampm;
  final int hour;
  final int minute;

  TodoList(
    {this.id,
    required this.info,
    required this.date1,
    required this.date2,
    required this.ampm,
    required this.hour,
    required this.minute
  });


  TodoList.fromMap(Map<String, dynamic> res)
    : id = res['id'],
      info = res['info'],
      date1 = res['date1'],
      date2 = res['date2'],
      ampm = res['ampm'],
      hour = res['hour'],
      minute = res['minute'];


  Map<String, Object?> toMap(){
    return {'id': id, 'info': info, 'date1':date1, 'date2':date2, 'ampm':ampm, 'hour':hour, 'minute':minute};
  }

}