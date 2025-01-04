import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String firstPart;
  final String highlightedPart;
  final TextStyle? firstPartStyle;
  final TextStyle? highlightedPartStyle;
  final VoidCallback? onHighlightedPartTap;
  final TextAlign textAlign;
  CustomRichText({
    required this.firstPart,
    required this.highlightedPart,
    this.firstPartStyle,
    this.textAlign = TextAlign.center,
    this.highlightedPartStyle,
    this.onHighlightedPartTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: firstPart,
            style: firstPartStyle ??
                const TextStyle(color: Colors.black, fontSize: 16),
          ),
          TextSpan(
            text: highlightedPart,
            style: highlightedPartStyle ??
                const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onHighlightedPartTap,
          ),
        ],
      ),
    );
  }
}
