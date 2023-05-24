import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/result.dart';
import 'widgets/quiz.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final List<Map<String, Object>> _questions = const [
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1}
      ],
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Coelho', 'score': 10},
        {'text': 'Cobra', 'score': 5},
        {'text': 'Elefante', 'score': 3},
        {'text': 'Leão', 'score': 1}
      ],
    },
    {
      'question': 'Qual é o seu instruor favorito?',
      'answers': [
        {'text': 'Maria', 'score': 10},
        {'text': 'João', 'score': 5},
        {'text': 'Leo', 'score': 3},
        {'text': 'Pedro', 'score': 1}
      ],
    }
  ];
  int _selectedQuestion = 0;
  int _totalScore = 0;

  void _onAnswerQuestion(int score) {
    if (_hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _onRestartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get _hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(48, 48, 48, 1),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: const Text('Quiz'),
          elevation: 0,
        ),
        body: _hasSelectedQuestion
            ? Quiz(
                _questions,
                _selectedQuestion,
                _onAnswerQuestion,
                _hasSelectedQuestion,
              )
            : Result(
                _totalScore,
                _onRestartQuiz,
              ),
      ),
    );
  }
}
