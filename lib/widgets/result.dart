import 'package:flutter/material.dart';

import 'button.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final void Function() _onRestartQuiz;

  String get _resultPhrase {
    String resultPhrase;

    if (_totalScore < 8) {
      resultPhrase = 'Parabéns!';
    } else if (_totalScore < 12) {
      resultPhrase = 'Você é bom!';
    } else if (_totalScore < 16) {
      resultPhrase = 'Impressionante!';
    } else {
      resultPhrase = 'Nível Jedi!';
    }

    return resultPhrase;
  }

  const Result(this._totalScore, this._onRestartQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Text(
              _resultPhrase,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Button(
          'Reiniciar Questionário',
          _onRestartQuiz,
        ),
      ],
    );
  }
}
