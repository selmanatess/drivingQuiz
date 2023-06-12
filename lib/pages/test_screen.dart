import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/widget/testbuttonCostum.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widget/test_button_widget.dart';

class testScreen extends StatefulWidget {
  final String col1;
  const testScreen({super.key, required this.col1});

  @override
  State<testScreen> createState() => _testScreenState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class _testScreenState extends State<testScreen> {
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
                      child: TestbuttonCustom(
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
    );
  }
}
