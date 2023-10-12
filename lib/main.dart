import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: TheDicePage(),
      ),
    ),
  );
}

/*
class DicePage extends StatelessWidget {
  //where we create a variable
  int leftDiceNumber = 6;
  @override
  Widget build(BuildContext context) {
    //where we change a variable's value
    leftDiceNumber = 1;
    return Center(
        child: Row(children: <Widget>[
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: TextButton(
            child: Image(image: AssetImage('images/dice$leftDiceNumber.png')),
        onPressed: (){
              print('left button got pressed');
        }),
      )),
      SizedBox(width: 10),
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: TextButton(child: Image(image: AssetImage('images/dice6.png')), onPressed: (){
          print('right button got pressed');
        }),
      ))
    ]));
  }
}*/

class TheDicePage extends StatefulWidget {
  const TheDicePage({super.key});

  @override
  State<TheDicePage> createState() => _TheDicePageState();
}

class _TheDicePageState extends State<TheDicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 6;

  void changeDiceFace() {
    setState(() {
      //we add 1 bcs the result of randomising int with the limit 6 are 0-5
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //where we change a variable's value
    return Center(
        child: Row(children: <Widget>[
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image(
                        image: AssetImage('images/dice$leftDiceNumber.png'))
                    ),
              )),
          SizedBox(width: 10),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image(image: AssetImage('images/dice$rightDiceNumber.png'))
                )
              ))
        ]));
  }
}
