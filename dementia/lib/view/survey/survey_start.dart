import 'package:dementia/view/survey/privacy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyStartPage extends StatefulWidget {
  const SurveyStartPage({super.key});

  @override
  State<SurveyStartPage> createState() => _SurveyStartPageState();
}

class _SurveyStartPageState extends State<SurveyStartPage> {
  final PageController _nextController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('치매 검사'),
      ),
      body: Container(
        // color: Colors.amber[100],
        width: double.infinity,
        child: Column(
          children: [
          
            Column(
              children: const [

                Text(
                  '치매 검사를 ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF5B9D46),
                  ),
                ),
                Text(
                  '시작하시겠습니까?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF5B9D46),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '본 질문은 치매의 진단을 예측하는 것으로 \n치매 진단을 목적으로 하지 않습니다. \n정확한 진단을 위해서는 가까운 병원이나 \n보건소에 방문하시기 바랍니다.\n(연령 60대 이하 권장)',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 350,
                    height: 250,
                    child: Image.asset('images/dementiaStartPage.jpg')),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.off(const PrivacyPage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B9D46),
                      minimumSize: const Size(150, 80)),
                  child: const Text(
                    '설문하러 가기',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//---------Widget-----------
  // Date: 2023-01-08, anna
  // DementiaSurvey: pageView 생성
  // Widget _pages() {
  //   return PageView.builder(
  //     controller: PageController(
  //       initialPage: 0, //시작 페이지
  //     ),
  //     itemBuilder: (BuildContext context, int index) {
  //       return PageView(controller: _nextController, children: <Widget>[
  //         //-----1st page(개인정보보호법)-------
  //         PrivacyPage(pageCont: _nextController),
  //         //--------- 3rd page(검사 시작 전 확인 페이지)----------
  //         surveyStart()
  //         //3rd page End
  //       ]);
  //     },
  //   );
  // } //_pages

  Widget surveyStart() {
    return Column(
      children: [
        Column(
          children: const [
            SizedBox(height: 30),
            Text(
              '치매 검사를 ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF5B9D46),
              ),
            ),
            Text(
              '시작하시겠습니까?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF5B9D46),
              ),
            ),
            SizedBox(height: 30),
            Text(
              '본 질문은 치매의 진단을 예측하는 것으로 \n치매 진단을 목적으로 하지 않습니다. \n정확한 진단을 위해서는 가까운 병원이나 \n보건소에 방문하시기 바랍니다.\n(연령 60대 이상 권장)',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 350,
                height: 250,
                child: Image.asset('images/dementiaStartPage.jpg')),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                // Get.off(const PrivacyPage())
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B9D46),
                  minimumSize: const Size(150, 80)),
              child: const Text(
                '설문하러 가기',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  } //surveyStart

  Widget _btnNext(int pageNum) {
    return ElevatedButton(
        onPressed: () {
          //if로 한번 더 감싸기(개인정보보호법 둘 다 클릭 완료 시 넘어감)
          if (_nextController.hasClients) {
            _nextController.animateToPage(
              pageNum,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        child: const Text('다음'));
  } //

}//END