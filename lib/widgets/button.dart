import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _title;
  final void Function() _onPressed;
  final double _borderRadius = 28;

  const Button(this._title, this._onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Material(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(_borderRadius),
        elevation: 4,
        child: InkWell(
          onTap: _onPressed,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Container(
            width: double.maxFinite,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            child: Text(
              _title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
