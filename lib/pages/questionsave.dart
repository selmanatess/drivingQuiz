import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/pages/questionadd_screen.dart';
import 'package:driving_question/widget/bottom_navigation.dart';
import 'package:driving_question/widget/question_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controller/question_controller.dart';

class QuestionSave extends StatefulWidget {
  final String col1;
  final String doc1;
  const QuestionSave({super.key, required this.col1, required this.doc1});

  @override
  State<QuestionSave> createState() => _QuestionSaveState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;
PageController pageController = PageController();

class _QuestionSaveState extends State<QuestionSave> {
  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent),
                child: Text("Soru Ekle"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionAdd(
                            index: questionController.questionNumber.value,
                            col1: widget.col1,
                            doc1: widget.doc1),
                      ));
                },
              ),
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () => Navigator.pop(context),
          )),
      body: SafeArea(
        child: Stack(children: [
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
                questionController.getpageCount(snapshot.data!.size);
                return Container(
                  width: 100.w,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.size,
                    controller: questionController.pagecontroller,
                    itemBuilder: (context, index) => QuestionEdit(
                      index: index,
                      col1: widget.col1,
                      doc1: widget.doc1,
                    ),
                  ),
                );
              } else
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
              ;
            },
          ),
          Positioned(
              bottom: 0,
              child: BottoNavigation(
                col1: widget.col1,
                doc1: widget.doc1,
              ))
        ]),
      ),
    );
  }
}
