import 'package:flutter/material.dart';

import '../utils/GlobalColors.dart';

class CategoryCard extends StatelessWidget {
  String text;
  IconData icon;

  CategoryCard({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.only(top: 20),
        color: ColorConstants.light,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                size: 30,
                color: ColorConstants.PrimaryAssentColor,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ));
  }
}
