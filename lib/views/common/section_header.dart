import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget(
      {required this.title, required this.buttonText, this.onPressed, key})
      : super(key: key);

  final String title;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: onPressed == null ? () {} : onPressed,
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
