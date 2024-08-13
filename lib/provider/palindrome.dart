import 'package:flutter/material.dart';

class Palindrome extends ChangeNotifier {
  String _inputText = '';
  bool _isPalindrome = false;

  String get inputText => _inputText;

  bool get isPalindrome => _isPalindrome;

  void setInputText(String text) {
    _inputText = text;
    _checkPalindrome();
    notifyListeners();
  }

  void checkPalindrome() {
    _checkPalindrome();
    notifyListeners();
  }

  void _checkPalindrome() {
    String cleanedText =
        _inputText.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    String reversedText = cleanedText.split('').reversed.join('');
    _isPalindrome = cleanedText == reversedText;
  }
}
