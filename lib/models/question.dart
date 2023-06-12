class Question {
  final String questiontext;
  final List OptionList;
  final int trueOption;
  final String? image;
  Question(
      {required this.OptionList,
      required this.trueOption,
      required this.questiontext,
      this.image});
  Map<String, dynamic> getjson() => {
        "photoUrl": image,
        "optionList": OptionList,
        'trueoption': trueOption,
        'questiontext': questiontext
      };
}
