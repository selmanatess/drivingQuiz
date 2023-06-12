import 'package:driving_question/pages/test_screen.admin.dart';
import 'package:flutter/material.dart';

import '../widget/elevatedButton.dart';

class QuestionAddSubjectScreen extends StatelessWidget {
  const QuestionAddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Konu Seçin",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedWidget(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TestScreenAdmin(col1: "respect"),
                          ));
                    },
                    photo: "assets/img/respect.png",
                    text: "Trafik Adabı"),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedWidget(
                    text: "Trafik ve Çevre",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestScreenAdmin(
                              col1: "trafic",
                            ),
                          ));
                    },
                    photo: "assets/img/warning.png"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedWidget(
                    text: "Araç Tekniği",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TestScreenAdmin(col1: "vehicle"),
                          ));
                    },
                    photo: "assets/img/vehicle.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedWidget(
                    text: "İlk Yardım Bilgisi",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestScreenAdmin(
                              col1: "firstaid",
                            ),
                          ));
                    },
                    photo: "assets/img/firstaid.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}
