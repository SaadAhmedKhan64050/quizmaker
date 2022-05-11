// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, empty_constructor_bodies, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  // const OptionTile({ Key? key }) : super(key: key);
  final String option, description, correctAnswer, optionSelected;
  OptionTile(
      {required this.optionSelected,
      required this.correctAnswer,
      required this.description,
      required this.option});

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Row(children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
              border: Border.all(
                  color: widget.description == widget.optionSelected
                      ? widget.optionSelected == widget.correctAnswer
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7)
                      : Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(30)),
                      alignment: Alignment.center,
          child: Text(
            "${widget.option}",
            style: TextStyle(color: widget.optionSelected == widget.description?
            widget.correctAnswer == widget.optionSelected ? Colors.green.withOpacity(0.7): Colors.red : Colors.grey),
          ),
        ),
        SizedBox(width: 8,),
        Text(widget.description, style: TextStyle(fontSize: 17, color: Colors.black54),)
      ]),
    );
  }
}
