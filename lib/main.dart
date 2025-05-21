import 'package:ekhtibar_app/AppBrain.dart';
//import 'package:ekhtibar_app/question.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
AppBrain appBrain = AppBrain();
void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text("اختبار",),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}
class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
// Variables
  int rightAnswers = 0 ;
  List<Icon> answerResults = [];
  Icon _correctAnswer = Icon(Icons.thumb_up , color: Colors.green,);
  Icon _falseAnswer = Icon(Icons.thumb_down, color: Colors.red,);

_onBasicAlertPressed (context) {
 Alert(
   context:  context,
   title: "انتهاء الاختبار",
   desc: "لقد أجبت $rightAnswers أسئلة صحيحة من أصل 7",
   buttons: [DialogButton(
       padding: EdgeInsets.all(5.0),
       color: Colors.indigoAccent,
        width: 120.0,
       child: Text('ابدأ من جديد', style: TextStyle(fontSize: 20.0),),
       onPressed: () {
       Navigator.pop(context);
       })
   ]
 ).show();
 appBrain.reset();
 answerResults = [];
 rightAnswers = 0;
}

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQustionAnswer();
    Icon answer ;
    if (whatUserPicked == correctAnswer) {
      answer = _correctAnswer  ;
      rightAnswers++;
    }
    else {
      answer = _falseAnswer;}
    setState(() {
      appBrain.nextQuestion();
      if (appBrain.isFinished()){
        _onBasicAlertPressed(context);
      }
      else {
        answerResults.add(answer);
      }
    });
  }


  // List<String> questions = [
  //   'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب' ,
  //   'القطط هي حيوانات أليفة',
  //   'الصين موجودة في القارة الإفريقية',
  //   'الأرض مسطحة و ليست كروية '
  // ];
  // List<bool> answers = [
  //   true,
  //   true,
  //   false,
  //   false,
  // ];
  // List<String> questionImage = [
  //   'images/image-1.jpg',
  //   'images/image-2.jpg',
  //   'images/image-3.jpg',
  //   'images/image-4.jpg',
  //   // 'images/image-5.jpg',
  //   // 'images/image-6.jpg',
  //   // 'images/image-7.jpg'
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResults.map((e) {
            return Padding(
                padding: EdgeInsets.all(5.0),
                child: e,
            );
          }).toList(),
        ),
        Expanded(
          flex: 6,
          child: Column(
          children: [
            Image.asset(appBrain.getQuestionImage()) ,
            SizedBox(height: 20.0,),
            Text(appBrain.getQuestionText(),
              style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,)
          ],
        ),
        ), 
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
                onPressed: (){
              checkAnswer(true);
                },
                child: Text('صح' ,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black
                ),)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red

              ),
                onPressed: (){
checkAnswer(false);
                },
                child: Text('خطأ' ,
                  style: TextStyle(
                      fontSize: 22.0 ,
                    color: Colors.black
                  ),)),
          ),
        ),
      ],
    );
  }
}

