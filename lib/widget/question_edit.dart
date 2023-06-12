import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/controller/question_controller.dart';

import 'package:driving_question/models/question.dart';
import 'package:driving_question/pages/questionsave.dart';
import 'package:driving_question/widget/radio_listtile.dart';

import 'package:driving_question/widget/textfieldoptions.dart';
import 'package:driving_question/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuestionEdit extends StatefulWidget {
  final int index;
  final String col1;
  final String doc1;

  const QuestionEdit(
      {super.key, required this.col1, required this.doc1, required this.index});

  @override
  State<QuestionEdit> createState() => _QuestionEditState();
}

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class _QuestionEditState extends State<QuestionEdit> {
  List optionlist = [];
  TextEditingController aoptionsController = TextEditingController();

  TextEditingController boptionsController = TextEditingController();

  TextEditingController coptionsController = TextEditingController();

  TextEditingController doptionsController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  int trueoption = 0;
  @override
  void initState() {
    verioku();
    super.initState();
  }

  QuestionController question = QuestionController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestore
            .collection(widget.col1)
            .doc(widget.doc1)
            .collection("questions")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Bir şeyler Yanlış Gitti"),
            );
          }
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      imageUrl == null
                          ? Container()
                          : Container(
                              height: 25.h,
                              width: 95.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2, color: Colors.blueGrey)),
                              child: Image(image: NetworkImage(imageUrl!)),
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 5.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "${widget.index + 1}. Soru/" +
                                      "${snapshot.data!.size}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.cyan)),
                                onPressed: () {},
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      textfieldWidget(
                          hintext: "Soru yazın",
                          controller: questionController,
                          keyboardType: TextInputType.text),
                      TextfieldOptions(
                        controller: aoptionsController,
                        hinttext: "A şıkkı",
                      ),
                      TextfieldOptions(
                        controller: boptionsController,
                        hinttext: "B şıkkı",
                      ),
                      TextfieldOptions(
                        controller: coptionsController,
                        hinttext: "C şıkkı",
                      ),
                      TextfieldOptions(
                        controller: doptionsController,
                        hinttext: "D şıkkı",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 5.h,
                            width: 19.w,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: trueoption,
                                  onChanged: (value) {
                                    setState(() {
                                      trueoption = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "A",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 19.w,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: trueoption,
                                  onChanged: (value) {
                                    setState(() {
                                      trueoption = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "B",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 19.w,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: trueoption,
                                  onChanged: (value) {
                                    setState(() {
                                      trueoption = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 19.w,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: trueoption,
                                  onChanged: (value) {
                                    setState(() {
                                      trueoption = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "D",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.cyan),
                              onPressed: () async {
                                optionlist.clear();

                                optionlist.add(aoptionsController.text);
                                optionlist.add(boptionsController.text);
                                optionlist.add(coptionsController.text);
                                optionlist.add(doptionsController.text);
                                firestore
                                    .collection(widget.col1)
                                    .doc(widget.doc1)
                                    .collection("questions")
                                    .doc(snapshot.data!.docs[widget.index]
                                        ["name"])
                                    .update({
                                  "questions": questionController.text,
                                  "trueoption": trueoption,
                                  "optionList": optionlist,
                                  "imageUrl": imageUrl
                                });
                              },
                              child: Text(
                                "Soruyu Güncelle",
                                style: TextStyle(color: Colors.white),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.cyan),
                              onPressed: () {
                                firestore
                                    .collection(widget.col1)
                                    .doc(widget.doc1)
                                    .collection("questions")
                                    .doc(snapshot.data!.docs[widget.index]
                                        ["number"])
                                    .delete();

                                question.getpageCount(snapshot.data!.size);
                              },
                              child: Text(
                                "Soruyu sil",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
          ;
        });
  }

  void verioku() async {
    var userdocuments = await firestore
        .collection(widget.col1)
        .doc(widget.doc1)
        .collection("questions")
        .get();

    var data = userdocuments.docs[widget.index].data();
    setState(() {
      questionController.text = data["questions"];
      aoptionsController.text = data["optionList"][0];
      boptionsController.text = data["optionList"][1];
      coptionsController.text = data["optionList"][2];
      doptionsController.text = data["optionList"][3];
      trueoption = data["trueoption"];
      imageUrl = data["imageUrl"];
    });
  }

  String? imageUrl;
}
