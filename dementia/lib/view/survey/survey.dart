import 'package:dementia/data/dementia_answer_final.dart';
import 'package:dementia/data/dementia_survey.dart';
import 'package:dementia/data/dementia_survey_answerlist.dart';
import 'package:dementia/predict_data/dementia_predict.dart';
import 'package:dementia/predict_data/dementia_reg_predict.dart';
import 'package:dementia/view/survey/survey_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SurveyPage extends StatefulWidget {
   const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  late PageController pageController = PageController();
  DementiaSurvey surveyList = DementiaSurvey();
  DementiaAnswerList surveyAnswerList = DementiaAnswerList();
late int selectedPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedPage = 0;
    // Timer.periodic(const Duration(seconds:1), (Timer timer){
    //   if (selectedPage > 1){
    //     selectedPage++;
    //   }else{
    //     selectedPage = 0;
    //   }
    //   pageController.animateToPage(
    //     duration: const Duration(milliseconds: 350),
    //     selectedPage, curve:Curves.easeIn);

    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('치매 검사'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          pages(),
        ],
      ),
    );
  } //BUILD


// -------------------Widgets-------------------


// 설문조사 페이지뷰
  Widget pages() {
    return Flexible(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (int value) {
          selectedPage = value;
          print(selectedPage);
        },
        physics: const NeverScrollableScrollPhysics(),
        itemCount: surveyList.questions.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            // color: Colors.amber[100],
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    children: <Widget>[
                      //페이지 퍼센티지 보여주기(linear indicator)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: LinearPercentIndicator(
                          // width: double.infinity,
                          lineHeight: 25.0,
                          percent: (index + 1) *
                              100 /
                              surveyList.questions.length.toDouble() * 0.01,
                          center: Text(
                            // "${((index + 1) * 100 / surveyList.questions.length.toDouble()).toStringAsFixed(1)}%",
                            "${index + 1} / ${surveyList.questions.length}",
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                        ),
                      ),

                      //질문 리스트
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          surveyList.questions.elementAt(index),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),

                      // 답변 위젯 리스트
                      SizedBox(
                        height: MediaQuery.of(context).size.aspectRatio * 600,
                        child: surveyAnswerList.dementiaAnswerList
                            .elementAt(index),
                      ),
                    ],
                  ),
                ),
                //pageBtn(selectedPage)

                // button widget
                if (selectedPage + 1 == surveyList.questions.length)
                  resultBtn()
                else
                  pageBtn(selectedPage)
              ],
            ),
          );
        },
      ),
    );
  } // pages for survey



  Widget pageBtn(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
          onPressed: () {
            pageController.jumpToPage(index + 1);
          },
          child: const Text('다음')),
    );
  }// pageBtn


  Widget resultBtn() {
    return
    // 설문 끝낸 후 결과로 가는 버튼
      SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        onPressed: () async {
          print("호호");
                print(DementiaAnswerFinal.wordsCount);

                print("나이");
                print(DementiaAnswerFinal.finalAge);
                print('totaltotal');
                print(DementiaAnswerFinal.total);
                
                DementiaPredict predict = DementiaPredict();
                DementiaPredictReg predictReg = DementiaPredictReg();
                
                String result = await predict.predict(
                  DementiaAnswerFinal.finalAge,
                  DementiaAnswerFinal.total,
                  DementiaAnswerFinal.edu1,
                  DementiaAnswerFinal.wage1,
                  DementiaAnswerFinal.gender1,
                );
                
                String resultReg = await predictReg.predict(
                  DementiaAnswerFinal.finalAge,
                  DementiaAnswerFinal.total,
                  DementiaAnswerFinal.edu1,
                  DementiaAnswerFinal.wage1,
                  DementiaAnswerFinal.gender1,
                );
                print('결과');
                print(result);
                print('결과 퍼센트');
                print(resultReg);
          Get.off(LoadingPage(result: result, resultReg: resultReg));
        },
        child: const Text('결과 확인하려 가기'),
      ),
    );
  }//resultBtn


} //END
