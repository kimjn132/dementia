import 'package:dementia/data/dementia_answer_final.dart';
import 'package:dementia/view/survey/survey.dart';
import 'package:flutter/material.dart';


class DementiaAnswerList {
  List<Widget> dementiaAnswerList = const [
    AList(),
    BList(),
    CList(),
    DList(),
    EList(),
    FList(),
    GList(),
    HList(),
    IList()
  ];
} //DementiaAnswerList Assemble

//Answer List Widget Starts

class AList extends StatefulWidget {
  const AList({super.key});

  @override
  State<AList> createState() => _AListState();
}

class _AListState extends State<AList> {
  DementiaAnswerList pageNext = DementiaAnswerList();
  TextEditingController yearController = TextEditingController();
  late SurveyPage pageController = const SurveyPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: yearController,
            decoration: const InputDecoration(hintText: '1990'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
                if(yearController.text=='2023'){
                  DementiaAnswerFinal.yearCount = 3;
                }else{
                  DementiaAnswerFinal.yearCount = 0;
                }
                print("년도맞춤");
                print(DementiaAnswerFinal.yearCount);
            },
          ),
          
        ],
      ),
    );
  }
} //AList


class BList extends StatefulWidget {
  const BList({super.key});

  @override
  State<BList> createState() => _BListState();
}

class _BListState extends State<BList> {
  List<Widget> season = [
    const Text('봄'),
    const Text('여름'),
    const Text('가을'),
    const Text('겨울')
  ];

  final List<bool> _selectedSeason = <bool>[true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ToggleButtons(
            onPressed: (index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < _selectedSeason.length; i++) {
                  _selectedSeason[i] = i == index;
                }

                if(_selectedSeason[3] == true){
                  DementiaAnswerFinal.seasoncount = 3;
                }else{
                  DementiaAnswerFinal.seasoncount = 0;
                }
                print(_selectedSeason[3]);
                print("계절맞춤");
                print(DementiaAnswerFinal.seasoncount);
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            // selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 60.0,
            ),
            isSelected: _selectedSeason,
            children: season)
      ],
    );
  }
} //BList

class CList extends StatefulWidget {
  const CList({super.key});

  @override
  State<CList> createState() => _CListState();
}

class _CListState extends State<CList> {
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: dateController,
            decoration: const InputDecoration(hintText: '23'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if(dateController.text=='23'){
                DementiaAnswerFinal.datecount = 3;
              }else{
                DementiaAnswerFinal.datecount = 0;
              }
              print("일자");
              print(DementiaAnswerFinal.datecount);
            },
          )
        ],
      ),
    );
  }
} //CList



class DList extends StatefulWidget {
  const DList({super.key});

  @override
  State<DList> createState() => _DListState();
}

class _DListState extends State<DList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      DementiaAnswerFinal.days = 'Monday';
                    },
                    child: const Text('월요일')),
                ElevatedButton(
                    onPressed: () {
                      DementiaAnswerFinal.days = 'Thursday';
                    },
                    child: const Text('화요일')),
                ElevatedButton(
                    onPressed: () {
                      DementiaAnswerFinal.days = 'Wednesday';
                    },
                    child: const Text('수요일')),
              ],
            ),
            SizedBox(
              height: 48,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                ElevatedButton(
                    onPressed: () {
                      DementiaAnswerFinal.days = 'Thursday';
                    },
                    child: const Text('목요일')),
                ElevatedButton(
                    onPressed: () {
                      DementiaAnswerFinal.days = 'Friday';
                    },
                    child: const Text('금요일')),
                ElevatedButton(
                    onPressed: () {
                      DementiaAnswerFinal.days = 'Saturday';
                    },
                    child: const Text('토요일')),
              ],
              ),
            ),
            SizedBox(
              height: 48,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DementiaAnswerFinal.days = 'Sunday';
                      },
                      child: const Text('일요일')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} //DList


//EList
class EList extends StatefulWidget {
  const EList({super.key});

  @override
  State<EList> createState() => _EListState();
}

class _EListState extends State<EList> {
  List<Widget> country = [
    const Text('대한민국'),
    const Text('미국'),
    const Text('일본')
  ];

  final List<bool> _selectedcountry = <bool>[true, false, false];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ToggleButtons(
            onPressed: (index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < _selectedcountry.length; i++) {
                  _selectedcountry[i] = i == index;
                }
                if (_selectedcountry[0] == true) {
                  DementiaAnswerFinal.countrycount = 3;
                } else {
                  DementiaAnswerFinal.countrycount = 0;
                }
                print("거주 나라");
                print(DementiaAnswerFinal.countrycount);
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            //selectedBorderColor: Colors.blue[700],
            selectedColor: Colors.white,
            fillColor: Colors.red[200],
            color: Colors.red[400],
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedcountry,
            children: country),
      ],
    );
  }
} //EList

class FList extends StatefulWidget {
  const FList({super.key});

  @override
  State<FList> createState() => _FListState();
}

class _FListState extends State<FList> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                DementiaAnswerFinal.address1 = "서울특별시";
                DementiaAnswerFinal.address1Count = 3;
              },
              child: const Text('서울특별시')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                DementiaAnswerFinal.address1 = "인천시";
              },
              child: const Text('인천시')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                DementiaAnswerFinal.address1 = "경상북도";
              },
              child: const Text('경상북도')),
        ),
      ],
    );
  }
} //FList


class GList extends StatefulWidget {
  const GList({super.key});

  @override
  State<GList> createState() => _GListState();
}

class _GListState extends State<GList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("시군구 확인");
    print(DementiaAnswerFinal.address3Count);
    if (DementiaAnswerFinal.address2 == '대덕구'){
      DementiaAnswerFinal.address2Count = 3;
    }else{
      DementiaAnswerFinal.address2Count = 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  DementiaAnswerFinal.address2 = "대덕구";
                  DementiaAnswerFinal.address2Count = 3;
                },
                child: const Text('대덕구')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  DementiaAnswerFinal.address2 = "동구";
                },
                child: const Text('동구')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  DementiaAnswerFinal.address2 = "중구";
                },
                child: const Text('중구')),
          ),
        ],
      ),
    );
  }
} //GList


class HList extends StatefulWidget {
  const HList({super.key});

  @override
  State<HList> createState() => _HListState();
}

class _HListState extends State<HList> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    if (DementiaAnswerFinal.address3 == '신대동'){
      DementiaAnswerFinal.address3Count = 3;
    }else{
      DementiaAnswerFinal.address3Count = 0;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  DementiaAnswerFinal.address3 = "신대동";
                  DementiaAnswerFinal.address3Count = 3;
                },
                child: const Text('신대동')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  DementiaAnswerFinal.address3 = "황호동";
                },
                child: const Text('황호동')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  DementiaAnswerFinal.address3 = "신탄진동";
                },
                child: const Text('신탄진동')),
          ),
        ],
      ),
    );
  }
} //HList


class IList extends StatefulWidget {
  const IList({super.key});

  @override
  State<IList> createState() => _IListState();
}

class _IListState extends State<IList> {

  TextEditingController aProductController = TextEditingController();
  TextEditingController bProductController = TextEditingController();
  TextEditingController cProductController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    aProductController = TextEditingController();
    bProductController = TextEditingController();
    cProductController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: aProductController,
            decoration: const InputDecoration(
                hintText: '단어를 입력하세요.',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ))),
            onChanged: (value) {
              if(aProductController.text == '연필'){
                DementiaAnswerFinal.num1 = 2;
              }else{
                DementiaAnswerFinal.num1 = 0;
              }
              print("단어1");
              print(DementiaAnswerFinal.num1);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: bProductController,
            decoration: const InputDecoration(
                hintText: '단어를 입력하세요.',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ))),
            onChanged: (value) {
              if(bProductController.text == '모자'){
                DementiaAnswerFinal.num2 = 2;
              }else{
                DementiaAnswerFinal.num2 = 0;
              }
              print("단어2");
              print(DementiaAnswerFinal.num2);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: cProductController,
            decoration: const InputDecoration(
                hintText: '단어를 입력하세요.',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ))),
            onChanged: (value) {
              if(cProductController.text == '나무'){
                DementiaAnswerFinal.num3 = 2;
              }else{
                DementiaAnswerFinal.num3 = 0;
              }
              print("단어3");
              print(DementiaAnswerFinal.num3);
              
            },
          ),
        ],
      ),
    );
  }
}
