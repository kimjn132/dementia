import 'package:dementia/view/register/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedPage;
  late PageController pageController = PageController();
  late List<String> info = [];
  late List<String> images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedPage = 0;
    pageController = PageController(initialPage: selectedPage);

    info = [
      "AI기반 치매도 측정 서비스 입니다.",
      'K-MMSE 설문조사를 통해 치매도를 측정해 보세요',
      '치매도 측정 후 다양한 정보를 얻어가세요'
    ];

    images = [
      'images/brain.png',
      'images/brainAdult.png',
      'images/professional.png'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('치매 AI 기반 서비스'),
        elevation: 0,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //기본 메인 환영 페이지(앱 이용 간단 설명)
          viewPage(),
          pageIndicate(),
          const SizedBox(
            height: 150,
          ),
          button()
        ],
      ),
    );
  } // build()

  // -------------------Widgets-------------------

  // anna
  // 2023-1-21, 메인 페이지
  Widget viewPage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
      child: Container(
        // color: Colors.amber[100],
        width: double.infinity,
        height: 250.0,
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (int value) {
            setState(() {
              selectedPage = value;
            });
          },
          itemCount: info.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 150,
                  child: Image.asset(images.elementAt(index)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  info.elementAt(index),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  } // viewPage()

  Widget pageIndicate() {
    return SizedBox(
      // color: Colors.red[50],
      width: double.infinity,
      height: 20.0,
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: info.length,
            effect: const SwapEffect(),
            ),
        ],
      ),
    );
  } // pageIndicate()


  Widget button(){
    return SizedBox(
      // color: Colors.amber[100],
      width: 200,
      height: 80,
      child: ElevatedButton(
        onPressed: () {
          Get.off(const LoginPage());
        },
        child: const Text('치매 설문 하러 가기')),
    );
  }//button()

}//END