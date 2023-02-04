import 'package:flutter/material.dart';
import 'package:mental_health_app/auth/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(username: '', email: '', uid: '', profileImage: '');

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
