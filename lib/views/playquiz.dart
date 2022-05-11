// ignore_for_file: unused_import, use_key_in_widget_constructors, avoid_print, unnecessary_string_interpolations, deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, unused_element, unnecessary_null_comparison, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/models/question_model.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/results.dart';
import 'package:quizmaker/widgets/quiz_play_widget.dart';

import '../widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  // var quizID;
  // const PlayQuiz({Key? key, required this.quizID, required this.quizId}) : super(key: key);

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
  QuerySnapshot<dynamic>? questionSnapshot;

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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                questionSnapshot?.docs == null
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
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
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: (() {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: ((context) => Results(correct: _correct, incorrect: _incorrect, total: total,))
          ));
        } ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Q${widget.index + 1}) ${widget.questionModel.question}",
            style: TextStyle(fontSize: 20, color: Colors.black87)),
        SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.answered) {
              //correct
              if (widget.questionModel.option1 ==
                  widget.questionModel.correctOption) {
                optionSelected = widget.questionModel.option1;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              } else {
                optionSelected = widget.questionModel.option1;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: OptionTile(
            correctAnswer: widget.questionModel.correctOption,
            description: widget.questionModel.option1,
            option: "A",
            optionSelected: optionSelected,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.answered) {
              //correct
              if (widget.questionModel.option2 ==
                  widget.questionModel.correctOption) {
                optionSelected = widget.questionModel.option2;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                print("${widget.questionModel.correctOption}");
                setState(() {});
              } else {
                optionSelected = widget.questionModel.option2;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: OptionTile(
            correctAnswer: widget.questionModel.correctOption,
            description: widget.questionModel.option2,
            option: "B",
            optionSelected: optionSelected,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.answered) {
              //correct
              if (widget.questionModel.option3 ==
                  widget.questionModel.correctOption) {
                optionSelected = widget.questionModel.option3;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              } else {
                optionSelected = widget.questionModel.option3;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: OptionTile(
            correctAnswer: widget.questionModel.correctOption,
            description: widget.questionModel.option3,
            option: "C",
            optionSelected: optionSelected,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            if (!widget.questionModel.answered) {
              //correct
              if (widget.questionModel.option4 ==
                  widget.questionModel.correctOption) {
                optionSelected = widget.questionModel.option4;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              } else {
                optionSelected = widget.questionModel.option4;
                widget.questionModel.answered = true;
                _incorrect = _incorrect + 1;
                _notAttempted = _notAttempted - 1;
                setState(() {});
              }
            }
          },
          child: OptionTile(
            correctAnswer: widget.questionModel.correctOption,
            description: widget.questionModel.option4,
            option: "D",
            optionSelected: optionSelected,
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
