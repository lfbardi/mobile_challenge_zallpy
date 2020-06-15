import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/bussiness/entities/question.dart';

class QuestionService {
  static String _baseUrl = 'http://10.0.2.2:5000/v1/questions';

  static Future<List<Question>> getAllQuestions() async {
    http.Response response = await http.get(_baseUrl);
    print(response.body);
    List questions = jsonDecode(response.body);
    return questions.map((question) => Question.fromJson(question)).toList();
  }

  static Future createQuestion(Question question) async {
    await http.post(
      _baseUrl,
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(question));
  }
}