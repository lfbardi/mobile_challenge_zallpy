class Question {
  String id;
  String title;
  String correctAnswer;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  String company;

  Question({
    this.id,
    this.title,
    this.company,
    this.correctAnswer,
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    correctAnswer = json['correctAnswer'];
    company = json['company'];
    answerA = json['answerA'];
    answerB = json['answerB'];
    answerC = json['answerC'];
    answerD = json['answerD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> question = Map<String, dynamic>();
    question['id'] = id;
    question['title'] = title;
    question['correctAnswer'] = correctAnswer;
    question['company'] = company;
    question['answerA'] = answerA;
    question['answerB'] = answerB;
    question['answerC'] = answerC;
    question['answerD'] = answerD;
    return question;
  }
}