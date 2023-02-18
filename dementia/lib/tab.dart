import 'package:dementia/view/mypage/my_page.dart';
import 'package:dementia/view/survey/survey_start.dart';
import 'package:dementia/view/todolist/todolist.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState() {
    
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

@override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      TabBarView(
        controller: controller,
        children: const [
          SurveyStartPage(),
          TodoListPage(),
          MyPage(),

        ]),
      bottomNavigationBar: SizedBox(
        // color: Colors.yellowAccent,
        height: 70,
        child: TabBar(
            controller: controller,
            labelColor: Color(0xff383636),
            // indicatorColor: Colors.red, 
          tabs: const [
            Tab(
              icon: Icon(
                Icons.border_color
              ),
              text: "검사",
            ),
            Tab(
              icon: Icon(
                Icons.checklist
              ),
              text: "할일목록",
            ),
            Tab(
              icon: Icon(
                Icons.face
              ),
              text: "마이페이지",
            )
          ]),
      ),
    );
  }
}