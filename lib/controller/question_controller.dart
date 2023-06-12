import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_question/models/fakeQuestion.dart';
import 'package:driving_question/models/question.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  Animation get animation => this._animation!;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  PageController _pageController = PageController(initialPage: 0);
  PageController get pagecontroller => _pageController;
  List<String> _testlist = [];
  List<String> get testlist => _testlist;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  bool _isexecute = true;
  bool get isexecute => _isexecute;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  int _selectedAns = 0;
  int get selectedAns => _selectedAns;

  RxInt _questionNumber = 1.obs;
  Rx get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  int _listsize = 0;
  int get listsize => _listsize;
  int _numOffalseAns = 0;
  int get numOffalseAns => _numOffalseAns;
  int _second = 30;
  int get seconds => _second;
  CollectionReference<Map<String, dynamic>>? _userdocument;

  CollectionReference<Map<String, dynamic>> get userdocument => _userdocument!;

  String _test = '';
  String get test => _test;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: seconds), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });

    super.onInit();
  }

  void runtimer() {
    _animationController!.reset();
    _animationController!.forward();
  }

  int sayi = 0;
  int tamsayi() {
    return sayi = (seconds * animation.value).toInt();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.trueOption;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns)
      _numOfCorrectAns++;
    else
      _numOffalseAns++;
  }

  void onClose() {
    super.onClose();
    _animationController!.dispose();
  }

  void getpageCount(int listSize) {
    _listsize = listSize;
  }

  void nextQuestion() {
    if (_questionNumber.value != _listsize) {
      _isAnswered = false;
      if (_questionNumber < _listsize) {
        _questionNumber = _questionNumber + 1;
      }

      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    }
  }

  void previousQuestion() {
    if (_questionNumber.value != _listsize + 1) {
      _isAnswered = false;
      if (_questionNumber > 1) {
        _questionNumber = _questionNumber - 1;
      }
      _pageController.previousPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    }
  }

  // Future<List<Question>> getFirebase() async {
  //   var _usersdocument = await _firestore
  //       .collection("question")
  //       .doc("respect")
  //       .collection("test1")
  //       .get();

  //   _listsize = _usersdocument.size;
  //   for (var eleman in _usersdocument.docs) {
  //     Map userMap = eleman.data();
  //     Question question = Question(
  //         OptionList: userMap["optionList"],
  //         trueOption: userMap["trueoption"],
  //         questiontext: userMap["questiontext"]);
  //     questions.add(question);
  //   }
  //   update();
  //   return questions;
  // }
}
