import 'package:driving_question/pages/question_finish_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Appbarbox extends StatefulWidget implements PreferredSizeWidget {
  const Appbarbox({super.key});

  @override
  State<Appbarbox> createState() => _AppbarboxState();

  @override
  Size get preferredSize => Size(100.w, 8.h);
}

class _AppbarboxState extends State<Appbarbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => questionFinish(),
                    ));
              },
              child: Text(
                "Sınavı Bitir",
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
    );
  }
}
