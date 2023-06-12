import 'package:driving_question/controller/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          width: double.infinity,
          height: 3.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(50)),
          child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              return Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                      width: constraints.maxWidth *
                          controller.animation.value, // yüzdelik
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              colors: [Colors.green, Colors.red])),
                    ),
                  ),
                  Positioned.fill(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.tamsayi().toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                            height: 20,
                            width: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: SvgPicture.asset(
                                "assets/svg/clock.svg",
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                            ))
                      ],
                    ),
                  ))
                ],
              );
            },
          )),
    );
  }
}
