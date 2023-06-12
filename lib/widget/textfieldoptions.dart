import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextfieldOptions extends StatefulWidget {
  final TextEditingController controller;
  final String hinttext;
  const TextfieldOptions(
      {super.key, required this.controller, required this.hinttext});

  @override
  State<TextfieldOptions> createState() => _TextfieldOptionsState();
}

class _TextfieldOptionsState extends State<TextfieldOptions> {
  late FocusNode focusNode;
  bool isInFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = false;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 100.w,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 85.w,
            height: 8.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  controller: widget.controller,
                  focusNode: FocusNode(),
                  obscureText: false,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      hintText: widget.hinttext,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          //text kenarlık rengi
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3)))),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))
        ],
      ),
    );
  }
}
