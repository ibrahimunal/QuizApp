class Question {
  String _question;
  bool _answer;

  String get question => _question;

  set question(String value) => _question = value;

  bool get answer => _answer;

  set answer(bool value) => _answer = value;

  Question(this._question, this._answer);
}
