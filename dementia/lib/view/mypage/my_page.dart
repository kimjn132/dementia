import 'package:dementia/models/model_auth.dart';
import 'package:dementia/models/model_login.dart';
import 'package:dementia/view/mypage/info_fix.dart';
import 'package:dementia/view/mypage/todo.dart';
import 'package:dementia/view/version_and_resources/version.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('마이페이지'),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    LoginCheck(),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(thickness: 0.8, height: 1, color: Colors.grey),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const InfoFixChange();
                              }));
                            },
                            icon: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          // ignore: prefer_const_constructors
                          const Text(
                            "정보수정",
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const InfoFixChange();
                              }));
                            },
                            icon: const Icon(
                              Icons.addchart,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          // ignore: prefer_const_constructors
                          const Text("내 치매 그래프")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const TodoList();
                              }));
                            },
                            icon: const Icon(
                              Icons.local_pharmacy,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          // ignore: prefer_const_constructors
                          const Text("투약정보")
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(thickness: 0.8, height: 1, color: Colors.grey),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: TextButton(
                              onPressed: () {
                                //
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  side: const BorderSide(
                                    color: Colors.white10,
                                  )),
                              child: const Text(
                                '자주 묻는 사항',
                                //textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: TextButton(
                              onPressed: () {
                                //
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  side: const BorderSide(
                                    color: Colors.white10,
                                  )),
                              child: const Text('공지사항')),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const VersionPage();
                                }));
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  side: const BorderSide(
                                    color: Colors.white10,
                                  )),
                              child: const Text('버전 정보')),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  } //build

  // ---------------------widget---------------------

} //end

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    //final login = Provider.of<LoginModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Text("${authClient.user!.email!}님의 마이페이지",
            style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
