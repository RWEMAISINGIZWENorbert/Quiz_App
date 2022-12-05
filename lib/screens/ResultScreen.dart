import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/screens/HomeScreen.dart';
import 'package:quiz_app/utils/GlobalColors.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.totalQuestions,
      required this.attemptedQuestions,
      required this.color,
      required this.rightAnswers,
      required this.imgString,
      required this.heading1,
      required this.heading2});

  int totalQuestions;
  int attemptedQuestions;
  Color color;
  int rightAnswers;
  String imgString;
  String heading1;
  String heading2;

  late int per = Percentage();

  int Percentage() {
    double p = (rightAnswers / totalQuestions * 100);
    return p.round();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ColorConstants.PrimaryColor,
          child: Column(children: [
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                color: ColorConstants
                    .PrimaryColor, //Color.fromARGB(255, 33, 61, 54),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                      //  color: Color.fromARGB(255, 255, 94, 0),
                    ),
                  ),
                ])),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 50, 25, 40),
                  child: Column(children: [
                    Image.network(
                      imgString,
                      height: 100,
                      width: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$heading1",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$per' + '%' + ' Score',
                      style: TextStyle(
                          color: color,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '$heading2',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'You attempted $attemptedQuestions questions out of $totalQuestions from which $rightAnswers answers are correct.',
                      style: TextStyle(
                          color: Color.fromARGB(255, 33, 40, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Share with us : ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 65, 64, 64),
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/25/f3/c5/25f3c5a28bd422e8da0bb2d02f2e278d.png'),
                          radius: 13,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://thumbs.dreamstime.com/b/mobile-173831891.jpg'),
                          radius: 13,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://e7.pngegg.com/pngimages/567/358/png-clipart-white-and-black-phone-logo-whatsapp-computer-icons-mobile-phones-logo-black-and-white-text-silhouette.png'),
                          radius: 13,
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
