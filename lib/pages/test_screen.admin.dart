import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/controller/question_controller.dart';

import 'package:driving_question/widget/elevatedButton.dart';
import 'package:driving_question/widget/test_button_widget.dart';
import 'package:driving_question/widget/textfieldoptions.dart';
import 'package:driving_question/widget/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widget/question_edit.dart';

class TestScreenAdmin extends StatefulWidget {
  final String col1;

  const TestScreenAdmin({
    super.key,
    required this.col1,
  });

  @override
  State<TestScreenAdmin> createState() => _TestScreenAdminState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class _TestScreenAdminState extends State<TestScreenAdmin> {
  TextEditingController testnameController = TextEditingController();
  @override
  void dispose() {
    testnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
                size: 30,
              ),
              onPressed: Navigator.of(context).pop),
          centerTitle: true,
          title: Text(
            "Testler",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          backgroundColor: Colors.indigo.shade400),
      body: SafeArea(
          child: StreamBuilder(
        stream: firestore.collection(widget.col1).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Bir şeyler Yanlış Gitti"),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) => InkWell(
                      child: TestButton(
                        col1: widget.col1,
                        index: index,
                      ),
                    ));
          } else
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          ;
        },
      )),
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.add_circle,
          size: 75,
          color: Colors.blueAccent.shade400,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: 25.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            controller: testnameController,
                            focusNode: FocusNode(),
                            obscureText: false,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: "Test Adı girin",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    //text kenarlık rengi
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 3)))),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            fixedSize: Size(40.w, 8.h),
                          ),
                          onPressed: () {
                            uploadQuestion();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Test oluştur",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> uploadQuestion() async {
    await firebaseFirestore
        .collection(widget.col1)
        .doc(testnameController.text)
        .set({"name": testnameController.text});
  }
}
