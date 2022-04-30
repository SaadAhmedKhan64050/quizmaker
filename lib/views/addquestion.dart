// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3, option4;
  // uploadQuizData(){
  //   if(_formKey.currentState!.validate()){

  //   }
  // }
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Please Enter The Question" : null;
                },
                decoration: InputDecoration(
                  hintText: "Question",
                ),
                onChanged: (val) {
                  question = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Please Enter the Option1" : null;
                },
                decoration: InputDecoration(
                  hintText: "Option1 (Correct Answer)",
                ),
                onChanged: (val) {
                  option1 = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Please Enter the Option2 " : null;
                },
                decoration: InputDecoration(
                  hintText: "Option2",
                ),
                onChanged: (val) {
                  option2 = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Please Enter The Option3 " : null;
                },
                decoration: InputDecoration(
                  hintText: "Option3",
                ),
                onChanged: (val) {
                  option3 = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Please Enter The option4 " : null;
                },
                decoration: InputDecoration(
                  hintText: "Option4",
                ),
                onChanged: (val) {
                  option4 = val;
                },
              ),
              Spacer(),
              Row(
                children: [
                  blueButton(
                      context: context,
                      label: "Submit",
                      ButtonWidth: MediaQuery.of(context).size.width / 2 - 36),
                  SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: blueButton(
                        context: context,
                        label: "Add Question",
                        ButtonWidth: MediaQuery.of(context).size.width / 2 - 36),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ));
  }
}
