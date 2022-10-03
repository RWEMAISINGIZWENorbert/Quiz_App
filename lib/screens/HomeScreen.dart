import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/models/QandA.dart';
import 'package:quiz_app/screens/QuizScreen.dart';
import 'package:quiz_app/utils/GlobalColors.dart';

import '../custom_widgets/CategoryCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//['What talent would you show off in a talent show?','What\'s one of your favorite comfort foods?','Favorite city?','If you were a vegetable, what vegetable would you be?']

  final List<QuestionAndAnswer> qAndAns = [
    QuestionAndAnswer(
        Question: 'Who wrote Charlie and the Chocolate Factory??',
        Answers: [
          'Mark Wiens',
          'Roald Dahl',
          'William Crawford',
          'Terrence Lewis'
        ],
        CorrectAnswer: 'Roald Dahl'),
    QuestionAndAnswer(
        Question:
            'The Mona Lisa by Leonardo da Vinci is on display in which Paris museum?',
        Answers: [
          'The Louvre',
          'The British Museum',
          'Mauritshius',
          'Taxila Museum'
        ],
        CorrectAnswer: 'The Louvre'),
    QuestionAndAnswer(
        Question: 'How many lines are there in a sonnet?',
        Answers: ['5', '12', '14', '9'],
        CorrectAnswer: '14'),
    QuestionAndAnswer(
        Question:
            'In childrens literature, what kind of animal is Mrs Tiggy-Winkle?',
        Answers: ['Hedgehog', 'Lion', 'Buffalo', 'Sqirrel'],
        CorrectAnswer: 'Hedgehog'),
    QuestionAndAnswer(
        Question:
            'Horatio, Ophelia and Gertrude are characters in which William Shakespeare tragedy?',
        Answers: ['Macbeth', 'Romeo & Juliet', 'Hamlet', 'The Tempest'],
        CorrectAnswer: 'Hamlet'),
    QuestionAndAnswer(
        Question:
            'What was the first James Bond novel to be published by Ian Fleming?',
        Answers: [
          'Live and Let Die',
          'Casino Royale',
          'Moonraker',
          'Diamonds are Forever'
        ],
        CorrectAnswer: 'Casino Royale'),
    QuestionAndAnswer(
        Question:
            'Which animal is the mascot of Hufflepuff house in the Harry Potter series?',
        Answers: ['Dog', 'Polar Bear', 'Rat', 'Badger'],
        CorrectAnswer: 'Badger'),
    QuestionAndAnswer(
        Question: 'In which country was Frida Kahlo born?',
        Answers: ['Mexico', 'France', 'Germany', 'Spain'],
        CorrectAnswer: 'Mexico'),
    QuestionAndAnswer(
        Question: 'Who illustrated Roald Dahls books?',
        Answers: [
          'JK Rowling',
          'Quentin Blake',
          'Richard Corben',
          'Mark Hughes'
        ],
        CorrectAnswer: 'Quentin Blake'),
    QuestionAndAnswer(
        Question: 'In which European city is the Prado Art Gallery?',
        Answers: ['Madrid', 'Berlin', 'Rome', 'Paris'],
        CorrectAnswer: 'Madrid'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorConstants.light,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => {},
                      icon: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    ),
                    Text(
                      'Quiz App',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.123rf.com%2Fphoto_29213195_male-silhouette-avatar-profile-picture.html&psig=AOvVaw0DAr-gtYQYcoG3bM25s4qM&ust=1664606551317000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJDQ6eb0u_oCFQAAAAAdAAAAABAE'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorConstants.PrimaryAssentColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                    ),
                  ]),
              margin: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dummy text',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '230',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dummy text',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            '1250',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizScreen(
                            QandAnsList: qAndAns,
                            heading: 'Art and Litrature',
                          )),
                );
              },
              child: CategoryCard(
                text: 'Art and Litrature',
                icon: Icons.design_services,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizScreen(
                            QandAnsList: qAndAns,
                            heading: 'General Knowledge',
                          )),
                );
              },
              child: CategoryCard(
                text: 'General Knowledge',
                icon: Icons.info,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizScreen(
                            QandAnsList: qAndAns,
                            heading: 'Science & Nature',
                          )),
                );
              },
              child: CategoryCard(
                text: 'Science & Nature',
                icon: Icons.science,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizScreen(
                            QandAnsList: qAndAns,
                            heading: 'Technology',
                          )),
                );
              },
              child: CategoryCard(
                text: 'Technology',
                icon: Icons.ad_units,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: (() {}),
                child: Text(
                  'Upgrade',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
