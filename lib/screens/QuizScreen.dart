import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/models/QandA.dart';
import 'package:quiz_app/screens/HomeScreen.dart';
import 'package:quiz_app/screens/ResultScreen.dart';
import 'package:quiz_app/utils/GlobalColors.dart';

class QuizScreen extends StatefulWidget {
  // const QuizScreen({super.key});
  final String heading;
  static const String RemoveMe = 'REMOVE ME';
  final List<QuestionAndAnswer> QandAnsList;

  const QuizScreen({Key? key, required this.heading, required this.QandAnsList})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Color optionColor = Colors.white;
  int tappedIndex = -1;
  String passedImg =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdqAzdrgfgFE2-hQw7-wGtFwp9tZ7Z3nXWyNz0lySjRvjQLA_KO87o_SUvvr5_OMXCys&usqp=CAU';
  String timeUp =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCAdJcgnFrrlDU1UxdcKyhkhI2S3U1BrDs9w&usqp=CAU';
  String failedImg =
      'https://backgroundlabs.com/files/failed-background-2940.png';
  List<String> option = ['A', 'B', 'C', 'D'];
  int isCorrect = 0;
  var ca = 0;
  late int _selectedIndex;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var questionCounter = 0;

  @override
  Widget build(BuildContext context) {
    var questionMaxLength = widget.QandAnsList.length;
    print(questionMaxLength);

    var question = widget.QandAnsList[questionCounter].Question;

    void getCurrentQuestion() {
      setState(() {
        if (questionCounter < 9) {
          questionCounter++;
          isCorrect = 0;
          question = widget.QandAnsList[questionCounter].Question;
        }
      });
    }

    // setState(() {
    //   question = widget.QandAnsList[questionCounter].Question;
    // });

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ColorConstants.PrimaryColor, //Color.fromARGB(255, 13, 22, 27),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                color: ColorConstants.light, //Color.fromARGB(255, 33, 61, 54),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.science,
                        size: 30,
                        color: ColorConstants.PrimaryAssentColor,
                        //  color: Color.fromARGB(255, 255, 94, 0),
                      ),
                      Text(
                        widget.heading,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question : ' +
                          (questionCounter + 1).toString() +
                          '/' +
                          questionMaxLength.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    CircularCountDownTimer(
                      duration: 60,
                      initialDuration: 0,
                      controller: CountDownController(),
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.12,
                      ringColor: Colors.grey[300]!,
                      ringGradient: null,
                      fillColor: Colors.orange!,
                      fillGradient: null,
                      backgroundColor: Colors.purple[500],
                      backgroundGradient: null,
                      strokeWidth: 5.0,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverse: true,
                      isReverseAnimation: true,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        //debugPrint('Countdown Started');
                      },
                      onComplete: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                    totalQuestions: questionMaxLength,
                                    attemptedQuestions: questionCounter,
                                    rightAnswers: ca,
                                    imgString: timeUp,
                                    heading1: 'Time is up !',
                                    heading2:
                                        'Try to attempt quiz within time limit')));
                      },
                      onChange: (String timeStamp) {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.0005,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  question,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 7,
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (questionCounter == questionMaxLength - 1) {
                            openDialog('Quiz Completed!',
                                'Click on the Submit button below to see the Result');
                          }
                          if (widget.QandAnsList[questionCounter]
                                  .Answers[index] ==
                              widget
                                  .QandAnsList[questionCounter].CorrectAnswer) {
                            setState(() {
                              tappedIndex = index;
                              ca++;
                              isCorrect = 1;

                              Timer(Duration(seconds: 1), () {
                                getCurrentQuestion();
                              });
                            });
                          } else {
                            setState(() {
                              tappedIndex = index;
                              isCorrect = 2;

                              Timer(Duration(seconds: 1), () {
                                getCurrentQuestion();
                              });
                            });
                          }
                        },
                        child: OptionField(
                          option[index],
                          widget.QandAnsList[questionCounter].Answers[index],
                          ValueKey(index.toString()),
                          tappedIndex == index ? isCorrect : 0,
                        ),
                      );
                    },
                  )),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 255, 81, 0)),
                child: TextButton(
                  onPressed: () {
                    print('Value of question: $questionCounter');
                    if (questionCounter == questionMaxLength - 1 &&
                        ca >= (questionMaxLength) / 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            totalQuestions: questionMaxLength,
                            attemptedQuestions: (questionCounter + 1),
                            rightAnswers: ca,
                            imgString: passedImg,
                            heading1: 'Quiz Completed',
                            heading2: 'You have passed the quiz',
                          ),
                        ),
                      );
                    } else if (questionCounter == questionMaxLength - 1 &&
                        ca < (questionMaxLength) / 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            totalQuestions: questionMaxLength,
                            attemptedQuestions: (questionCounter + 1),
                            rightAnswers: ca,
                            imgString: failedImg,
                            heading1: 'Quiz Completed',
                            heading2: 'You have failed the quiz',
                          ),
                        ),
                      );
                    } else {
                      openDialog('Quiz Incomplete',
                          'Complete the quiz and then hit the Submit Button');
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget OptionField(
    String a,
    String b,
    ValueKey key,
    int isCorrect,
  ) {
    return AnimatedContainer(
        key: ValueKey(key),
        duration: Duration(seconds: 1),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: (isCorrect == 1)
                ? Colors.green
                : (isCorrect == 2)
                    ? Colors.red
                    : Colors.white),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 255, 123, 0)),
              child: Text(
                '$a',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              '$b',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ));
  }
/*  Widget OptionField(String a, String b, Key key, int s) {
return AnimatedContainer(
    key: key,
    duration: Duration(seconds: 1),
    height: MediaQuery.of(context).size.height * 0.07,
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: (s == 1)
            ? Colors.green
            : (s == 2)
                ? Colors.red
                : Colors.white),
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.height * 0.055,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 255, 123, 0)),
          child: Text(
            '$a',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          '$b',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ]),
    ));
  }*/

  Future openDialog(String a, String b) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('$a'),
          content: Text("$b"),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
}
