import 'package:driving_question/controller/question_controller.dart';

import 'package:driving_question/widget/question_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../pages/question_screen.dart';

class BottoNavigation extends StatefulWidget {
  final String col1;
  final String doc1;
  const BottoNavigation({
    super.key,
    required this.col1,
    required this.doc1,
  });

  @override
  State<BottoNavigation> createState() => _BottoNavigationState();
}

class _BottoNavigationState extends State<BottoNavigation> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qncontroller) {
        return StreamBuilder(
          stream: firestore
              .collection(widget.col1)
              .doc(widget.doc1)
              .collection("questions")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Bir şeyler yanlış gitti"),
              );
            }
            if (snapshot.hasData) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  color: Colors.white,
                  height: 10.h,
                  width: 100.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            qncontroller.getpageCount(snapshot.data!.size);
                            qncontroller.previousQuestion();
                          },
                          child: Container(
                            height: 5.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100))),
                            child: Center(
                                child: Text(
                              "Önceki",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          height: 8.h,
                          width: 36.w,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Doğru Sayısı  ",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.lightBlue),
                                  ),
                                  Text(
                                    qncontroller.numOfCorrectAns.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Yanlış Sayısı  ",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red),
                                  ),
                                  Text(
                                    qncontroller.numOffalseAns.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            qncontroller.getpageCount(snapshot.data!.size);
                            qncontroller.nextQuestion();
                            if (controller.listsize !=
                                controller.questionNumber) {
                              controller.runtimer();
                            }
                          },
                          child: Container(
                            height: 5.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                            child: Center(
                                child: Text(
                              "Sonraki",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
          },
        );
      },
    );
  }
}
