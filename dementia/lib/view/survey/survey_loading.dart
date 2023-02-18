import 'package:dementia/data/dementia_detail_predict.dart';
import 'package:dementia/data/dementia_predict.dart';
import 'package:dementia/view/survey/survey_result.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';


class LoadingPage extends StatefulWidget {

  final String result;
  final String resultReg;


  const LoadingPage({super.key, required this.result, required this.resultReg});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}


class _LoadingPageState extends State<LoadingPage> {

  DementiaPredict predict = DementiaPredict();
  DementiaDetailPredict predictReg = DementiaDetailPredict();
  late String result;
  late String resultReg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    result = '1';
    resultReg = '2';
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return EasySplashScreen(
      logo: Image.asset("images/todoList.png"),
      title: const Text(
        "결과를 분석 중입니다.",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text("정확한 분석을 위해 잠시만 기다려 주세요."),
      navigator: SurveyResultPage(result: widget.result, resultReg: widget.resultReg),
      durationInSeconds: 3,
    );
  }//build

  
}//END
