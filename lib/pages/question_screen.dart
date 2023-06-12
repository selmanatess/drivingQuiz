import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/controller/question_controller.dart';
import 'package:driving_question/models/fakeQuestion.dart';
import 'package:driving_question/models/question.dart';
import 'package:driving_question/pages/questionsave.dart';
import 'package:driving_question/widget/appbarwidget.dart';
import 'package:driving_question/widget/bottom_navigation.dart';
import 'package:driving_question/widget/options.dart';
import 'package:driving_question/widget/progressbar.dart';
import 'package:driving_question/widget/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuestionScreen extends StatefulWidget {
  final String col1;
  final String doc1;
  const QuestionScreen({super.key, required this.col1, required this.doc1});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;
QuestionController controller = Get.put(QuestionController());

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbarbox(),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ProgressBar(),
                StreamBuilder(
                  stream: firestore
                      .collection(widget.col1)
                      .doc(widget.doc1)
                      .collection("questions")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Bir şeyler Yanlış Gitti"),
                      );
                    }
                    if (snapshot.hasData) {
                      controller.getpageCount(snapshot.data!.size);
                      return Container(
                        height: 100.h,
                        width: 90.w,
                        color: Colors.white,
                        child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.size,
                          controller: controller.pagecontroller,
                          itemBuilder: (context, index) => QuestionCard(
                              size: snapshot.data!.size,
                              question: Question(
                                  image: snapshot.data?.docs[index]["imageUrl"],
                                  OptionList: snapshot.data?.docs[index]
                                      ["optionList"],
                                  trueOption: snapshot.data?.docs[index]
                                      ["trueoption"],
                                  questiontext: snapshot.data?.docs[index]
                                      ["questions"])),
                        ),
                      );
                    } else
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.green,
                      ));
                  },
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: BottoNavigation(
                col1: widget.col1,
                doc1: widget.doc1,
              ))
        ]));
  }
}
