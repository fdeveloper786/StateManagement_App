// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MarioGame extends StatefulWidget {
  const MarioGame({Key? key}) : super(key: key);

  @override
  State<MarioGame> createState() => _MarioGameState();
}

class _MarioGameState extends State<MarioGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.blue,
                )),
            Container(
              height: 10,
              color: Colors.green,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.brown,
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('jump');
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('jump');
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('jump');
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  Icon? icon;
  Function? method;
  Color? myColor;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
