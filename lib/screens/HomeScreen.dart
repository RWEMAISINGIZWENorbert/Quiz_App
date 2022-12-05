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

  final List<QuestionAndAnswer> artsAndLiterature = [
    QuestionAndAnswer(
        Question: 'Who wrote Charlie and the Chocolate Factory ?',
        Answers: [
          'Mark Wiens',
          'Roald Dahl',
          'William Crawford',
          'Terrence Lewis'
        ],
        CorrectAnswer: 'Roald Dahl',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'The Mona Lisa by Leonardo da Vinci is on display in which Paris museum ?',
        Answers: [
          'The Louvre',
          'The British Museum',
          'Mauritshius',
          'Taxila Museum'
        ],
        CorrectAnswer: 'The Louvre',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many lines are there in a sonnet ?',
        Answers: ['5', '12', '14', '9'],
        CorrectAnswer: '14',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'In childrens literature, what kind of animal is Mrs Tiggy-Winkle ?',
        Answers: ['Hedgehog', 'Lion', 'Buffalo', 'Sqirrel'],
        CorrectAnswer: 'Hedgehog',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'Horatio, Ophelia and Gertrude are characters in which William Shakespeare tragedy ?',
        Answers: ['Macbeth', 'Romeo & Juliet', 'Hamlet', 'The Tempest'],
        CorrectAnswer: 'Hamlet',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'What was the first James Bond novel to be published by Ian Fleming ?',
        Answers: [
          'Live and Let Die',
          'Casino Royale',
          'Moonraker',
          'Diamonds are Forever'
        ],
        CorrectAnswer: 'Casino Royale',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'Which animal is the mascot of Hufflepuff house in the Harry Potter series ?',
        Answers: ['Dog', 'Polar Bear', 'Rat', 'Badger'],
        CorrectAnswer: 'Badger',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'In which country was Frida Kahlo born ?',
        Answers: ['Mexico', 'France', 'Germany', 'Spain'],
        CorrectAnswer: 'Mexico',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Who illustrated Roald Dahls books ?',
        Answers: [
          'JK Rowling',
          'Quentin Blake',
          'Richard Corben',
          'Mark Hughes'
        ],
        CorrectAnswer: 'Quentin Blake',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'In which European city is the Prado Art Gallery ?',
        Answers: ['Madrid', 'Berlin', 'Rome', 'Paris'],
        CorrectAnswer: 'Madrid',
        color: Colors.white),
  ];

  final List<QuestionAndAnswer> generalKnowledge = [
    QuestionAndAnswer(
        Question: 'What was Meta Platforms Inc formerly known as ?',
        Answers: ['Twitter', 'Facebook', 'Snapchat', 'Dropbox'],
        CorrectAnswer: 'Facebook',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many lives is a cat said to have ?',
        Answers: ['7', '3', '1', '9'],
        CorrectAnswer: '9',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many wisdom teeth does the average adult have ?',
        Answers: ['4', '5', '2', '3'],
        CorrectAnswer: '4',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many rings is the Olympic symbol made up of ?',
        Answers: ['6', '5', '7', '4'],
        CorrectAnswer: '5',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'What is a young giraffe called ?',
        Answers: ['A Chick', 'A Calf', 'A Kitten', 'A Foal'],
        CorrectAnswer: 'A Calf',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'Which is the only planet in our solar system not named after a Roman or Greek god ?',
        Answers: ['Neptune', 'Mars', 'Earth', 'Pluto'],
        CorrectAnswer: 'Earth',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'What is a female elephant called ?',
        Answers: ['Bitch', 'Cow', 'Hen', 'Doe'],
        CorrectAnswer: 'Cow',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Haematology is the study of what ?',
        Answers: [
          'The Blood',
          'Human Behavior',
          'Brain Psychology',
          'The Liver'
        ],
        CorrectAnswer: 'The Blood',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Which element is said to keep bones strong ?',
        Answers: ['Vitamin E', 'Zinc', 'Calcium', 'Potassium'],
        CorrectAnswer: 'Calcium',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'The logo for luxury car maker Porsche features which animal ?',
        Answers: ['Horse', 'Cheetah', 'Aligator', 'Lion'],
        CorrectAnswer: 'Horse',
        color: Colors.white),
  ];

  final List<QuestionAndAnswer> scienceAndNature = [
    QuestionAndAnswer(
        Question: 'Which is the largest internal organ in the human body ?',
        Answers: ['Heart', 'Lungs', 'Liver', 'Kidney'],
        CorrectAnswer: 'Liver',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'The rate at which the body produces energy from nutrients is controlled by which gland in the neck ?',
        Answers: ['Gall Bladder', 'Thyroid Gland', 'Pancreas', 'Gonades'],
        CorrectAnswer: 'Thyroid Gland',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'What is the biggest planet in our solar system ?',
        Answers: ['Jupiter', 'Saturn', 'Mars', 'Uranus'],
        CorrectAnswer: 'Jupiter',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'On the periodic table, what symbol stands for silver ?',
        Answers: ['Si', 'Au', 'Ag', 'Sv'],
        CorrectAnswer: 'Ag',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Which is the most sensitive of the senses ?',
        Answers: ['Taste', 'Seeing', 'Hearing', 'Smell'],
        CorrectAnswer: 'Smell',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many ribs do you have ?',
        Answers: ['18', '24', '16', '22'],
        CorrectAnswer: '24',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many hearts do octopuses have ?',
        Answers: ['1', '2', '3', '4'],
        CorrectAnswer: '3',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Humans and chimpanzees share roughly how much DNA ?',
        Answers: ['50 Percent', '74 Percent', '98 Percent', '89 Percent'],
        CorrectAnswer: '98 Percent',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'What is a material that will not carry an electrical charge called ?',
        Answers: ['Insulator', 'Neutral', 'Conductor', 'Semi-Conductor'],
        CorrectAnswer: 'Insulator',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'How many bones are there in a human body ?',
        Answers: ['108', '201', '206', '236'],
        CorrectAnswer: '206',
        color: Colors.white),
  ];

  final List<QuestionAndAnswer> technology = [
    QuestionAndAnswer(
        Question:
            'Which social media app only lets you view pictures and messages for a limited time ?',
        Answers: ['Twitter', 'Facebook', 'Snapchat', 'Instagram'],
        CorrectAnswer: 'Snapchat',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'In which year the Electronic copany NINTENDO was found ?',
        Answers: ['1864', '1946', '1889', '1975'],
        CorrectAnswer: '1889',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Originally Amazon only sold which product ?',
        Answers: ['Food Items', 'Video Games', 'Rugs', 'Books'],
        CorrectAnswer: 'Books',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'What is the name of the British computer scientist who invented the World Wide Web in 1989 ?',
        Answers: [
          'Tim Berners-Lee',
          'Bernard Hoppkinns',
          'Adam Richman',
          'Terrence Crawford'
        ],
        CorrectAnswer: 'Tim Berners-Lee',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Which duo invented the aeroplane ?',
        Answers: [
          'Hardy Brothers',
          'Wright Brothers',
          'The Melvins',
          'Serra Brothers'
        ],
        CorrectAnswer: 'Wright Brothers',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'What year did the first Apple iPhone launch ?',
        Answers: ['2006', '2005', '2009', '2007'],
        CorrectAnswer: '2007',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'Which prestigious university did Microsoft founder Bill Gates drop out of ?',
        Answers: ['Oxford', 'Harvard', 'Belgium', 'Manitoba'],
        CorrectAnswer: 'Harvard',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'What does LG stand for in LG Electronics ?',
        Answers: ['Lucky Goldstar', 'Liquid Glow', 'Light Gaze', 'Lewis Gene'],
        CorrectAnswer: 'Lucky Goldstar',
        color: Colors.white),
    QuestionAndAnswer(
        Question: 'Solar power generates electricity from what source ?',
        Answers: ['Moon', 'Star', 'Sun', 'Water'],
        CorrectAnswer: 'Sun',
        color: Colors.white),
    QuestionAndAnswer(
        Question:
            'Billionaire Jeff Bezos is CEO and President of which online retailer ?',
        Answers: ['Amazon', 'Google', 'Tesla', 'Microsoft'],
        CorrectAnswer: 'Amazon',
        color: Colors.white),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz App',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
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
                        'Total Users',
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
                        'Online Users',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            '14',
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
                            QandAnsList: artsAndLiterature,
                            heading: 'Art and Litrature',
                            icon: Icon(Icons.design_services),
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
                            QandAnsList: generalKnowledge,
                            heading: 'General Knowledge',
                            icon: Icon(Icons.info),
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
                            QandAnsList: scienceAndNature,
                            heading: 'Science & Nature',
                            icon: Icon(Icons.science),
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
                            QandAnsList: technology,
                            heading: 'Technology',
                            icon: Icon(Icons.ad_units),
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
