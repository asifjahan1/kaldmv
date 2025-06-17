import 'package:flutter/material.dart';

class FAQItem {
  final TextEditingController questionController;
  final TextEditingController answerController;

  FAQItem()
      : questionController = TextEditingController(),
        answerController = TextEditingController();

  void dispose() {
    questionController.dispose();
    answerController.dispose();
  }
}
