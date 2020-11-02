import 'package:flutter/material.dart';
import 'package:quizApp/ui/questionBuilder.dart';
import 'ui/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  List<Icon> iconList = [];
  int questionNum = 0;
  QuestionBuilder questionBuilder = QuestionBuilder();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "SCORE",
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Text(
                    "${score.toString()}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "${questionBuilder.getQuestion().question}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (!questionBuilder.isLast()) {
                    if (questionBuilder.getQuestion().answer) {
                      iconList.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                      score++;
                    } else {
                      iconList.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    questionBuilder.nextQuestion();
                  } else {
                    _showAlert(context);
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  if (!questionBuilder.isLast()) {
                    if (questionBuilder.getQuestion().answer) {
                      iconList.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    } else {
                      iconList.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                      score++;
                    }
                    questionBuilder.nextQuestion();
                  } else {
                    _showAlert(context);
                  }
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: iconList)
      ],
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Score"),
              content: Text("You finished the Quiz and your score is ${score}"),
            ));
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
