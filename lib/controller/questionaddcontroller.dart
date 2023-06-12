import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/controller/question_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/question.dart';

class QuestionAddController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> _optionList = [];
  List<String> get optionList => _optionList;

  List<int> _options = [0, 1, 2, 3];
  List<int> get options => _options;
  String? _imageUrl;
  String? get image => _imageUrl;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  int _answer = 3;
  int get answer => _answer;
  int? _currentoption = 2;
  int get currentoption => _currentoption!;

  void Onchanged(int value) {
    _currentoption = value;
    print(_currentoption);
    update();
  }

  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  void imageUpload(XFile? _file) async {
    if (_file != null) {
      Reference _profileREf = FirebaseStorage.instance
          .ref("images/questionimages/${uniqueFileName}");

      var _task = _profileREf.putFile(File(_file.path));

      _task.whenComplete(() async {
        _imageUrl = await _profileREf.getDownloadURL();
        update();
      });
    } else {
      // Kullanıcı fotoğraf yükleme işlemini başlatmadan geri döndü
      // Bu durumu uygun şekilde işleyebilirsiniz.
      print("Kullanıcı fotoğraf yükleme işlemini başlatmadan geri döndü.");
    }
    print(_imageUrl);
  }
}
