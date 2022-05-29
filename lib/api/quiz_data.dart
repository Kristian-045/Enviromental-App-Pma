import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Quizzes {
  Quizzes({
    required this.quizzes,
  });

  List<Quiz> quizzes;

  factory Quizzes.fromJson(Map<String, dynamic> json) => Quizzes(
    quizzes: List<Quiz>.from(
      json["quizzes"].map((x) => Quiz.fromJson(x)),
    ),
  );
}

class Quiz {
  final String id;
  final String name;
  final String questions;
  final String version;
  final String question_count;
  final String public;
  final String progress;



  const Quiz({
    required this.id,
    required this.name,
    required this.questions,
    required this.version,
    required this.question_count,
    required this.public,
    required this.progress,

  });

  factory Quiz.fromJson(Map<String, dynamic> data) {
    return Quiz(
      id: data['id'].toString(),
      name: data['name'].toString(),
      // questions: json.decode(data[0]['questions'].toString()),
      questions: data['questions'].toString(),
      version: data['version'].toString(),
      question_count: data['question_count'].toString(),
      public: data['public'].toString(),
      progress: data['progress'].toString(),
    );
  }
}

Future<Quizzes> fetchQuizzes() async {
  final response = await http
      .get(Uri.parse('http://eco-app.lubovnan.sk/api/quiz'),
      headers:{
        "Content-type": "application/json",
        "Accept": "application/json",
        // 'Authorization': "Bearer "+token
      }
  );


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print('aaa');
    // print(json.decode(response.body));

    print("heh");
    print(Quizzes.fromJson(jsonDecode(response.body)));
    // List<Quiz> list = json.decode(response.body);
    // Quiz quiz = list[0];
    // json.decode(response.body).cast<Quiz>()
    return Quizzes.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // print('bbb');
    print(response.statusCode);
    throw Exception('Failed to load user');
  }
}