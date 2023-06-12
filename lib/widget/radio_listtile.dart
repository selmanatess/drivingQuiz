import 'package:driving_question/controller/questionaddcontroller.dart';
import 'package:driving_question/widget/question_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RadioListTileWidget extends StatelessWidget {
  final int sayi;
  final String text;
  const RadioListTileWidget(
      {super.key, required this.text, required this.sayi});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionAddController>(
      init: QuestionAddController(),
      builder: (controller) {
        return Container(
          height: 5.h,
          width: 19.w,
          color: Colors.white,
          child: Row(
            children: [
              Radio(
                value: controller.options[sayi],
                groupValue: controller.currentoption,
                onChanged: (value) {
                  controller.Onchanged(value!);
                },
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        );
      },
    );
  }
}
