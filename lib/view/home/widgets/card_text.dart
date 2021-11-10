import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText(
      {Key? key,
      required this.text,
      this.fontWeight,
      this.fontSize = 16,
      this.color = Colors.black54})
      : super(key: key);
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize, color: color, fontWeight: fontWeight),
          ),
        ),
      ],
    );
  }
}
