// ignore_for_file: unused_import, use_key_in_widget_constructors, avoid_print, unnecessary_string_interpolations, deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, unused_element, unnecessary_null_comparison, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/models/question_model.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/widgets/quiz_play_widget.dart';

import '../widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  // const PlayQuiz({Key? key, required this.quizID}) : super(key: key);

  final String quizId;
  const PlayQuiz(this.quizId);

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot? questionSnapshot;

  QuestionModel getQuestionModelFromDatasnapshots(
      DocumentSnapshot questionsSnapshot) {
    QuestionModel questionModel = new QuestionModel();
    questionModel.question = questionsSnapshot.get("question");

    List<String> options = [
      questionsSnapshot.get("option1"),
      questionsSnapshot.get("option2"),
      questionsSnapshot.get("option3"),
      questionsSnapshot.get("option4"),
    ];
    options.shuffle();
    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionsSnapshot.get("option1");
    questionModel.answered = false;

    return questionModel;
  }

  @override
  void initState() {
    print("${widget.quizId}");
    databaseService.getQuizQData(widget.quizId).then((value) {
      questionSnapshot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionSnapshot!.docs.length;
      print("$total this is total");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: appBar(context),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black87),
          brightness: Brightness.light,
        ),
        body: Container(
          child: Column(
            children: [
              questionSnapshot!.docs == null
                  ? Container()
                   :ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: questionSnapshot!.docs.length,
                      itemBuilder: (context, index) {
                        return QuizPlayTile(
                          questionModel: getQuestionModelFromDatasnapshots(
                              questionSnapshot!.docs[index]),
                          index: index,
                        );
                      })
            ],
          ),
        ));
  }
}

class QuizPlayTile extends StatefulWidget {
  //  const QuizPlayTile({ Key? key }) : super(key: key);
  final QuestionModel questionModel;
  final int index;
  QuizPlayTile({required this.questionModel, required this.index});

  @override
  State<QuizPlayTile> createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(widget.questionModel.question),
        SizedBox(
          height: 4,
        ),
        OptionTile(
          correctAnswer: widget.questionModel.option1,
          description: widget.questionModel.option1,
          option: "Ä",
          optionSelected: optionSelected,
        ),
        SizedBox(
          height: 4,
        ),
        OptionTile(
          correctAnswer: widget.questionModel.option1,
          description: widget.questionModel.option2,
          option: "B",
          optionSelected: optionSelected,
        ),
        SizedBox(
          height: 4,
        ),
        OptionTile(
          correctAnswer: widget.questionModel.option1,
          description: widget.questionModel.option3,
          option: "C",
          optionSelected: optionSelected,
        ),
        SizedBox(
          height: 4,
        ),
        OptionTile(
          correctAnswer: widget.questionModel.option1,
          description: widget.questionModel.option4,
          option: "D",
          optionSelected: optionSelected,
        )
      ],
    ));
  }
}
