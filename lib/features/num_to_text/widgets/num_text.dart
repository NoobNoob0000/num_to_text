import 'package:flutter/material.dart';
import 'package:num_to_text/core/context/text_styles.dart';

class NumText extends StatelessWidget {
  const NumText({super.key, required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Number to text: ',
        style: MainPageTextStyle.title(context),
        children: [
          TextSpan(
            text: text,
            style: MainPageTextStyle.content(context),
          ),
        ],
      ),
    );
  }
}
