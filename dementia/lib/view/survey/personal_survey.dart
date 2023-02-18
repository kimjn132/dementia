import 'package:dementia/data/dementia_answer_final.dart';
import 'package:dementia/data/dementia_survey.dart';
import 'package:dementia/data/dementia_survey_answerlist.dart';
import 'package:dementia/view/survey/survey.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalSurveyPage extends StatefulWidget {
  const PersonalSurveyPage({super.key});

  @override
  State<PersonalSurveyPage> createState() => _PersonalSurveyPageState();
}

class _PersonalSurveyPageState extends State<PersonalSurveyPage> {
  DementiaSurvey surveyList = DementiaSurvey();
  DementiaAnswerList surveyAnswerList = DementiaAnswerList();

  late String dropdownValue;
  late List<bool> _selectedGender;

  //답변 전부 완료해야 다음 페이지로 넘어갈 수 있음
  late bool genderA;
  late bool ageA;
  late bool educA1;
  late bool economicA1;
  late String birth;

  late String educA;
  late String economicA;
  late int genderi;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy');
    String strToday = formatter.format(now).toString();

    for (int i = 1900; i <= int.parse(strToday); i++) {
      surveyList.year.add(i.toString());
    }

    genderA = true;

    dropdownValue = surveyList.year.last;
    _selectedGender = [true, false];

    ageA = false;
    educA1 = false;
    economicA1 = false;
    birth = "";

    educA = "";
    economicA = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('치매 검사'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              // color: Colors.amber[100],
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  gender(),
                  birthYear(),
                  educ(),
                  economic(),
                  _btnNext()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } //build

  // --------widget--------

  //gender
  Widget gender(){
    return ToggleButtons(
      //direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectedGender.length; i++) {
            _selectedGender[i] = i == index;
          }
        });
        if (_selectedGender[0] == true) {
          DementiaAnswerFinal.gender = '여자';
        } else {
          DementiaAnswerFinal.gender = '남자';
        }
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      // selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: const Color.fromARGB(255, 249, 212, 109),
      focusColor: const Color.fromARGB(255, 213, 160, 1),
      color: const Color.fromARGB(255, 13, 11, 4),
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 150.0,
      ),
      isSelected: _selectedGender,
      children: surveyList.gender,
    );
  } //gender
  

// 나이 (생년)
  Widget birthYear() {
    return 
    Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: '나이',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        items: surveyList.year.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (val) {
          //현재 년도에서 마이너스 해야됨
          DementiaAnswerFinal.age = val!;
          
        },
      ),
    );
  } //birthYear


// 교육 수준 확인
  Widget educ() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
            hintText: '교육연수',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        items: surveyList.edu.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          DementiaAnswerFinal.edu = value!;
        },
      ),
    );
  } // EDUC level

  Widget economic() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: '연봉(단위: 만원)',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        items: surveyList.wage.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          DementiaAnswerFinal.wage = value!;
        },
      ),
    );
  } //economic

  

  //next survey pageview page 넘어가기 버튼
  Widget _btnNext() {
    return ElevatedButton(
      onPressed: DementiaAnswerFinal.edu.isNotEmpty && DementiaAnswerFinal.wage.isNotEmpty && DementiaAnswerFinal.age.isNotEmpty ? () {
              Get.off(const SurveyPage());

              // setState(() {
              //   print("${educA}, ${birth}, ${economicA}, ${genderA}");
              // });
            }
          : null,
      child: const Text('다음'),
    );
  } //btnNext

} // END

