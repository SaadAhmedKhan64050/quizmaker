// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';

class Results extends StatefulWidget {
  const Results(
      {Key? key,
      required this.correct,
      required this.incorrect,
      required this.total})
      : super(key: key);
  final int correct, incorrect, total;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.correct} / ${widget.total}",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Your Answered ${widget.correct} answers correctly"
                "and ${widget.incorrect} answers incorrectly",
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context); 
                  },
                  child: blueButton(context: context, label: "Go to Home", ButtonWidth: 
                  MediaQuery.of(context).size.width/2))
            ],
          ), 
        ),
      ),
    );
  }
}
