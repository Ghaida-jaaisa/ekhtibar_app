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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Column(
          children: [
            Image.asset('images/image-1.jpg') ,
            SizedBox(height: 20.0,),
            Text('عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب ' ,
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
                onPressed: (){},
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
                onPressed: (){},
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

