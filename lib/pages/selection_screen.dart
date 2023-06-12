import 'package:driving_question/controller/question_controller.dart';
import 'package:driving_question/pages/authscreen.dart';

import 'package:driving_question/pages/test_screen.dart';

import 'package:driving_question/widget/elevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectionScreen extends StatefulWidget {
  final String name;
  const SelectionScreen({super.key, required this.name});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: SafeArea(
              child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Merhaba " + widget.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Lütfen çalışmak İstediğiniz konuyu seçin ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedWidget(
                                onPressed: () {
                                  setState(() {});

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => testScreen(
                                          col1: "respect",
                                        ),
                                      ));
                                },
                                photo: "assets/img/respect.png",
                                text: "Trafik Adabı"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedWidget(
                                text: "Trafik ve Çevre",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => testScreen(
                                                col1: "trafic",
                                              )));
                                },
                                photo: "assets/img/warning.png"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedWidget(
                                text: "Araç Tekniği",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => testScreen(
                                                col1: "vehicle",
                                              )));
                                },
                                photo: "assets/img/vehicle.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedWidget(
                                text: "İlk Yardım Bilgisi",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            testScreen(col1: "firstaid"),
                                      ));
                                },
                                photo: "assets/img/firstaid.png"),
                          )
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthScreen(),
                            ));
                      },
                      child: Text("admin Girişi"))
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
