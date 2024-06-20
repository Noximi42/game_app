import 'package:flutter/material.dart';
import 'package:mobile/models/user.dart';

class UserState extends ChangeNotifier {
  User _user = const User(id: "user-1", name: "");

  User get user => _user;

  void setUserName(String name) {
    setUser(User(id: user.id, name: name));
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
    User.upsertUser(user);
  }

  Future<bool> loadFromDb() async {
    _user = await User.getUser();
    return true;
  }
}
