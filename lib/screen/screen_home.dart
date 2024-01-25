import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quize.dart';
import 'package:quiz_app_test/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test1',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test1',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test1',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('myappappbartitle'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/logo.png',
                width: width * 0.8,
              ),
            ),
            Padding(padding: EdgeInsets.all(width * 0.024)),
            Text(
              '플러터 퀴스앱 테스트',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '퀴즈 풀기전 안내사항. \n 꼼꼼히 읽고 퀴즈풀기 클릭',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어'),
            _buildStep(width, '2. 문제읽고 정답체크 다음문제버튼 클릭'),
            _buildStep(width, '3. 인정향해 도전해'),
            Padding(padding: EdgeInsets.all(width * 0.048)),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                    minWidth: width * 0.8,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print('버튼쳐눌렀다');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      quizs: quizs,
                                    )));
                        // 버튼이 눌렸을 때 수행할 동작
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple, // 버튼의 배경색
                        onPrimary: Colors.white, // 텍스트 색상
                      ),
                      child: Text(
                        '지금 퀴즈 풀기',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(padding: EdgeInsets.only(right: width * 0.024)),
          Text(title),
        ],
      ),
    );
  }
}
