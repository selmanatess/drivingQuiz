import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/constant/constant.dart';
import 'package:driving_question/controller/questionaddcontroller.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/question_controller.dart';
import '../widget/question_edit.dart';
import '../widget/radio_listtile.dart';
import '../widget/test_button_widget.dart';
import '../widget/textfieldoptions.dart';
import '../widget/textfieldwidget.dart';

class QuestionAdd extends StatefulWidget {
  final int index;
  final String col1;
  final String doc1;
  const QuestionAdd(
      {super.key, required this.index, required this.col1, required this.doc1});

  @override
  State<QuestionAdd> createState() => _QuestionAddState();
}

class _QuestionAddState extends State<QuestionAdd> {
  TextEditingController aoptionsController = TextEditingController();

  TextEditingController boptionsController = TextEditingController();

  TextEditingController coptionsController = TextEditingController();

  TextEditingController doptionsController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  void dispose() {
    questionController.dispose();
    aoptionsController.dispose();
    boptionsController.dispose();
    coptionsController.dispose();
    doptionsController.dispose();
    super.dispose();
  }

  int trueoption = 0;
  List<String> optionlist = [];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GetBuilder<QuestionAddController>(
                    init: QuestionAddController(),
                    builder: (controller) {
                      return Container(
                          height: 25.h,
                          width: 95.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 2, color: Colors.blueGrey)),
                          child: controller.image == null
                              ? Center(
                                  child: Text("Fotoğraf Yükleyebilirsiniz"),
                                )
                              : Image(image: NetworkImage(controller.image!)));
                    },
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
                            child: StreamBuilder(
                              stream: firestore
                                  .collection(widget.col1)
                                  .doc(widget.doc1)
                                  .collection("questions")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Bir şeyler Yanlış Gitti");
                                }
                                if (snapshot.hasData) {
                                  questionNumber = snapshot.data!.size + 1;
                                  return Text(
                                    "${(snapshot.data!.size + 1)}. Soru",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  );
                                } else
                                  return Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ));
                              },
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.cyan)),
                            onPressed: () {
                              showbottom();
                            },
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
                      ]),
                  GetBuilder<QuestionAddController>(
                    init: QuestionAddController(),
                    builder: (controller) {
                      return ElevatedButton(
                          onPressed: () async {
                            if (questionController.text != "" &&
                                aoptionsController != "" &&
                                boptionsController != "" &&
                                coptionsController != "" &&
                                doptionsController.text != "") {
                              optionlist.clear();

                              optionlist.add(aoptionsController.text);
                              optionlist.add(boptionsController.text);
                              optionlist.add(coptionsController.text);
                              optionlist.add(doptionsController.text);

                              await firebaseFirestore
                                  .collection(widget.col1)
                                  .doc(widget.doc1)
                                  .collection("questions")
                                  .doc("${questionNumber.toString()}")
                                  .set({
                                "number": questionNumber.toString(),
                                "questions": questionController.text,
                                "trueoption": trueoption,
                                "optionList": optionlist,
                                "imageUrl": controller.image
                              }, SetOptions(merge: true));
                              constant().showSnackBar(context, "Soru eklendi");

                              questionController.text = "";
                              aoptionsController.text = "";
                              boptionsController.text = "";
                              coptionsController.text = "";
                              doptionsController.text = "";
                            } else
                              return constant().showSnackBar(
                                  context, "Lütfen zorunlu Alanları Doldurun");
                          },
                          child: Text("Soruyu Yükle"));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  dynamic showbottom() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 25.h,
            child: GetBuilder(
              init: QuestionAddController(),
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        XFile? _file =
                            await picker.pickImage(source: ImageSource.camera);
                        controller.imageUpload(_file);
                      },
                      selectedColor: Colors.cyan,
                      leading: Icon(Icons.camera_alt_outlined),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Kamerayı aç"),
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        XFile? _file =
                            await picker.pickImage(source: ImageSource.gallery);
                        controller.imageUpload(_file);
                      },
                      selectedColor: Colors.cyan,
                      leading: Icon(Icons.photo),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Galeriyi Aç"),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  // String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  // void imageUpload(XFile? _file) async {
  //   if (_file != null) {
  //     Reference _profileREf = FirebaseStorage.instance
  //         .ref("images/questionimages/${uniqueFileName}");

  //     var _task = _profileREf.putFile(File(_file.path));

  //     _task.whenComplete(() async {
  //       imageUrl = await _profileREf.getDownloadURL();
  //     });

  //   } else {
  //     // Kullanıcı fotoğraf yükleme işlemini başlatmadan geri döndü
  //     // Bu durumu uygun şekilde işleyebilirsiniz.
  //     print("Kullanıcı fotoğraf yükleme işlemini başlatmadan geri döndü.");
  //   }
  //   print(controller.image);
  // }
}
