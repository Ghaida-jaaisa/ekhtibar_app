import 'package:ekhtibar_app/question.dart';
import 'package:flutter/material.dart';

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

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = questionGroup[questionNumber].questionAnswer;
    Icon answer ;
    (whatUserPicked == correctAnswer) ? answer = _correctAnswer :  answer = _falseAnswer;
    setState(() {
      questionNumber++;
      answerResults.add(answer);
    });
  }
  List<Icon> answerResults = [];
  Icon _correctAnswer = Icon(Icons.thumb_up , color: Colors.green,);
  Icon _falseAnswer = Icon(Icons.thumb_down, color: Colors.red,);

  List<String> questions = [
    'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب' ,
    'القطط هي حيوانات أليفة',
    'الصين موجودة في القارة الإفريقية',
    'الأرض مسطحة و ليست كروية '
  ];
  List<bool> answers = [
    true,
    true,
    false,
    false,
  ];
  List<String> questionImage = [
    'images/image-1.jpg',
    'images/image-2.jpg',
    'images/image-3.jpg',
    'images/image-4.jpg',
    // 'images/image-5.jpg',
    // 'images/image-6.jpg',
    // 'images/image-7.jpg'
  ];
  List<Question> questionGroup = [
    Question(
        q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب' ,
        i: 'images/image-1.jpg',
        a: true),
    Question(
        q: 'القطط هي حيوانات أليفة',
        i: 'images/image-2.jpg',
        a: true),
    Question(
        q: 'الصين موجودة في القارة الإفريقية',
        i: 'images/image-3.jpg',
        a: false),
    Question(
        q: 'الأرض مسطحة و ليست كروية',
        i: 'images/image-4.jpg',
        a: false),
    Question(
        q: 'باستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
        i: 'images/image-5.jpg',
        a: true),
    Question(
        q: 'الشمس تدور حول الأرض و الأرض  تدور حول القمر',
        i: 'images/image-6.jpg',
        a: true),
    Question(
        q: 'الحيوانات لا تشعر بالألم',
        i: 'images/image-7.jpg',
        a: false),
  ];

//  Question question1 = Question(q:'quesion',i:'images/image-2.jpg',a:true);
  int questionNumber = 0;
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
            Image.asset(questionGroup[questionNumber].questionImage) ,
            SizedBox(height: 20.0,),
            Text(questionGroup[questionNumber].questionText,
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

