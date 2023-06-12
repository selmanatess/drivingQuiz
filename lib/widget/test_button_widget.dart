import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/pages/questionsave.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controller/question_controller.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class TestButton extends StatefulWidget {
  final String col1;
  final int index;

  const TestButton({
    super.key,
    required this.index,
    required this.col1,
  });

  @override
  State<TestButton> createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore.collection(widget.col1).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Bir şeyler Yanlış Gitti"),
          );
        }
        if (snapshot.hasData) {
          return Container(
            height: 50,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Uyarı!"),
                          content:
                              Text("Testi Silmek istediğinize emin misiniz?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  firestore
                                      .collection(widget.col1)
                                      .doc(snapshot.data?.docs[widget.index]
                                          ["name"])
                                      .delete();
                                  Navigator.pop(context);
                                },
                                child: Text("Evet")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Hayır"))
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.indigo.shade400,
                      fixedSize: Size(40, 25)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionSave(
                            col1: widget.col1,
                            doc1: snapshot.data?.docs[widget.index]["name"],
                          ),
                        ));
                  },
                  child: Text(
                    snapshot.data?.docs[widget.index]["name"],
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            ),
          );
        } else
          return Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
      },
    );
  }
}
