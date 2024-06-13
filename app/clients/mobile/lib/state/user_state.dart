import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  String _userName = "";

  String get userName => _userName;

  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }
}
