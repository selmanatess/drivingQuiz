import 'package:driving_question/controller/question_controller.dart';
import 'package:driving_question/pages/questionsave.dart';

import 'package:driving_question/pages/selection_screen.dart';
import 'package:driving_question/widget/costum_main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    return Scaffold(
        body: Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 35.h,
                  width: 65.w,
                  child: Image(image: AssetImage("assets/img/lights.png"))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ehliyet Sınavı Sorularına Hoşgeldiniz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: namecontroller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Adınız Soyadınız",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
              ),
              CostumMainButton(
                child: Text("İlerle"),
                color: Colors.green,
                isLoading: false,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SelectionScreen(name: namecontroller.text)
                          // SelectionScreen(name: namecontroller.text),
                          ));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
