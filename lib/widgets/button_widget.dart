// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/my_definition.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.width,
    required this.title,
    required this.btnColor,
    required this.textColor,
    required this.func,
  });

  final width;
  final title;
  final btnColor;
  final textColor;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: MyDefinition.PRIMARY_COLOR)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
          ),
        ),
      ),
    );
  }
}
