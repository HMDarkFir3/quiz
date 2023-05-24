import 'package:flutter/material.dart';

import 'question.dart';
import 'button.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final int _selectedQuestion;
  final void Function(int) _onAnswerQuestion;
  final bool _hasSelectedQuestion;

  const Quiz(this._questions, this._selectedQuestion, this._onAnswerQuestion,
      this._hasSelectedQuestion,
      {super.key});

  @override
  Widget build(BuildContext context) {
    String formattedQuestions =
        _questions[_selectedQuestion]['question'].toString();
    List<Map<String, Object>> awswers = _hasSelectedQuestion
        ? _questions[_selectedQuestion]['answers'] as List<Map<String, Object>>
        : [];
    List<Widget> buttonsWidgets = awswers
        .map((awswer) => Button(awswer['text'] as String,
            () => _onAnswerQuestion(int.parse(awswer['score'].toString()))))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(formattedQuestions),
        ...buttonsWidgets,
      ],
    );
  }
}
