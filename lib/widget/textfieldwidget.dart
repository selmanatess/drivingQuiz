import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class textfieldWidget extends StatefulWidget {
  final TextEditingController controller;

  final String hintext;
  final TextInputType keyboardType;
  const textfieldWidget(
      {super.key,
      required this.hintext,
      required this.controller,
      required this.keyboardType});

  @override
  State<textfieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<textfieldWidget> {
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
      height: 14.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          controller: widget.controller,
          focusNode: FocusNode(),
          maxLines: 3,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              fillColor: Colors.grey[100],
              filled: true,
              hintText: widget.hintext,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  //text kenarlık rengi
                  borderSide: BorderSide(color: Colors.blue, width: 3)))),
    );
  }
}
