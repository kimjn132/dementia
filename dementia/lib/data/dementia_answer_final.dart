abstract class DementiaAnswerFinal{
  

  static String days = '';
  static String address1 = '';
  static String address2 = '';
  static String address3 = '';


  static List<bool> season = [false,false,false,true];
  static List<bool> country = [true, false, false];
  static List<String> words = ['연필', '모자', '나무'];



  static int daysCount = 0;
  static int datecount = 0;
  static int address1Count = 0;
  static int address2Count = 0;
  static int address3Count = 0;
  static int yearCount = 0;
  static int seasoncount = 0;
  static int countrycount = 0;
  static int wordsCount = 0;
  static int num1 = 0;
  static int num2 = 0;
  static int num3 = 0;


  static int total = daysCount+datecount+address1Count+address2Count+address3Count+yearCount+seasoncount+countrycount+wordsCount+num1+num2+num3;


  static String age = '';

  static int finalAge = 2023 - int.parse(age);




  static String edu = '';


  static int edu1 = edu == '초등학교 졸업' ? 1 : 
             edu == '중학교 졸업' ? 2 :
             edu == '고등학교 졸업' ? 3 :
             edu == '대학(2~4년제)' ? 4 : 5;


  static String wage = '';

  static int wage1 = wage == '사무직 및 영업직' ? 5 : 
             wage =='소규모 자영업자' ? 4 :
             wage =='현장(숙련)작업자' ? 3 :
             wage == '미숙련 작업자' ? 2 : 1;


  static String gender = '';


  static int gender1 = gender == '남자' ? 1 : 0;
  
}