// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/create_quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference quizStream = FirebaseFirestore.instance.collection(
      "Quiz"); // DatabaseService databaseService = new DatabaseService();
  // DatabaseService databaseService = new DatabaseService();
  Widget quizList() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: StreamBuilder<QuerySnapshot>(
            stream: quizStream.snapshots(),
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return QuizTile(
                            ImgUrl:
                                snapshot.data!.docs[index].get("quizImgurl"),
                            desc: snapshot.data!.docs[index].get("quizDesc"),
                            title: snapshot.data!.docs[index].get("quizTitle"));
                      });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  // const QuizTile({ Key? key, required this.ImgUrl, required this.title, required this.desc }) : super(key: key);
  final String ImgUrl;
  final String title;
  final String desc;
  QuizTile({required this.ImgUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 200,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                ImgUrl,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.black26),
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                desc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ]),
          )
        ],
      ),
    );
  }
}
