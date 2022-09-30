import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/screens/HomeScreen.dart';
import 'package:quiz_app/utils/GlobalColors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String option1 = 'A';
  String option2 = 'B';
  String option3 = 'C';
  String option4 = 'D';
  @override
  Widget build(BuildContext context) {
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
                        color: Color.fromARGB(255, 255, 123, 0),
                        //  color: Color.fromARGB(255, 255, 94, 0),
                      ),
                      Text(
                        "Science and Nature",
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
                      'Quiz :' + ' 60',
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
                  "1. How long does it take Earth to complete one orbit around the Sun ? ",
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
                  OptionField(option1),
                  SizedBox(
                    height: 7,
                  ),
                  OptionField(option2),
                  SizedBox(
                    height: 7,
                  ),
                  OptionField(option3),
                  SizedBox(
                    height: 7,
                  ),
                  OptionField(option4)
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 255, 81, 0)),
                child: TextButton(
                  onPressed: () {},
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

  Widget OptionField(String a) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: RichText(
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
        ))
      ])),
    );
  }
}
