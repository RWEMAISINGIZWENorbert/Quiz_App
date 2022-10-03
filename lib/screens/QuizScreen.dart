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
  final List<QuestionAndAnswer> QandAnsList;

  const QuizScreen({Key? key, required this.heading, required this.QandAnsList})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String option1 = 'Yes';
  String option2 = 'No';
  String option3 = 'Maybe';
  String option4 = 'Nevermind';
  var tq = 60;
  var ca = 58;

  var questionCounter = 0;

  @override
  Widget build(BuildContext context) {
    var questionMaxLength = widget.QandAnsList.length;
    print(questionMaxLength);

    var question = widget.QandAnsList[questionCounter].Question;

    setState(() {
      question = widget.QandAnsList[questionCounter].Question;
    });

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
                      'Quiz : ' + questionMaxLength.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    CircularCountDownTimer(
                      duration: 30,
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
                        debugPrint('Countdown Started');
                      },
                      onComplete: () {
                        debugPrint('Countdown Ended');
                      },
                      onChange: (String timeStamp) {
                        debugPrint('Countdown Changed $timeStamp');
                      },
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
                child: Column(children: [
                  OptionField('A', option1),
                  SizedBox(
                    height: 7,
                  ),
                  OptionField('B', option2),
                  SizedBox(
                    height: 7,
                  ),
                  OptionField('C', option3),
                  SizedBox(
                    height: 7,
                  ),
                  OptionField('D', option4)
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 255, 81, 0)),
                child: TextButton(
                  onPressed: () {
                    print('Value of question: $questionCounter');
                    if (questionCounter == questionMaxLength - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              totalQuestions: tq, rightAnswers: ca),
                        ),
                      );
                    } else {
                      setState(() {
                        questionCounter++;
                      });
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

  Widget OptionField(String a, String b) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
        ),
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
    /* RichText(
          text: TextSpan(children: [
        WidgetSpan(
            child: Padding(
          padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
          child: Container(
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
        )),
        TextSpan(
            text: '  $b',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ])),*/
  }
}
