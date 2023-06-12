import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ElevatedWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String photo;
  const ElevatedWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.yellowAccent,
          fixedSize: Size(45.w, 22.h)),
      onPressed: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
          Container(
            height: 16.h,
            width: 50.w,
            child: Image(fit: BoxFit.fill, image: AssetImage(photo)),
          )
        ],
      ),
    );
  }
}
