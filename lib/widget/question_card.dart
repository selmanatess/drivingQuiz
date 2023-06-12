import 'package:driving_question/controller/question_controller.dart';
import 'package:driving_question/models/fakeQuestion.dart';
import 'package:driving_question/models/question.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'options.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({super.key, required this.question, required this.size});
  final Question question;
  final int size;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.question.image == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 95.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2, color: Colors.blueGrey)),
                    child: Image(image: NetworkImage(widget.question.image!)),
                  ),
                ),
          Obx(() => Text.rich(
                TextSpan(
                    text: "SORU ${_questionController.questionNumber.value}",
                    children: [
                      TextSpan(
                          text: "/${widget.size}",
                          style: TextStyle(fontSize: 18))
                    ]),
                style: TextStyle(fontSize: 26),
              )),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 90.w,
              child: Text(
                widget.question.questiontext,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          ...List.generate(
              widget.question.OptionList.length,
              (index) => OptionBox(
                    text: widget.question.OptionList[index],
                    index: index,
                    ontap: () {
                      _questionController.checkAns(widget.question, index);
                    },
                  ))
        ],
      ),
    );
  }
}
