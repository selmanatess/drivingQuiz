import 'package:driving_question/controller/question_controller.dart';
import 'package:driving_question/pages/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class questionFinish extends StatelessWidget {
  const questionFinish({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tebrikler",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Text(
                  "Puanınız:",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "${((controller.numOfCorrectAns * 100) / controller.listsize).toInt()}",
                    style: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectionScreen(name: "")),
                      );
                    },
                    child: Text("Ana Sayfaya Dön"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
