import 'package:driving_question/controller/question_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OptionBox extends StatefulWidget {
  final String text;
  final int index;
  final VoidCallback ontap;
  const OptionBox({
    super.key,
    required this.text,
    required this.index,
    required this.ontap,
  });

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  List option = ["A)", "B)", "C)", "D)"];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered == true &&
                qnController.isexecute == true) {
              if (widget.index == qnController.correctAns) {
                return Colors.green;
              } else if (widget.index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.white;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: widget.ontap,
              child: Container(
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 2,
                        color: qnController.isAnswered
                            ? getTheRightColor()
                            : Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Container(
                        color: Colors.white,
                        width: 70.w,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "${option[widget.index]} ${widget.text}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                            color: getTheRightColor() == Colors.white
                                ? Colors.transparent
                                : getTheRightColor(),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey.shade600)),
                        child: getTheRightColor() == Colors.white
                            ? null
                            : Icon(
                                getTheRightIcon(),
                                size: 16,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
