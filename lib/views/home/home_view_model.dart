import 'package:flutter/material.dart';
import 'package:login_app/core/base/base_view_model.dart';
import 'package:login_app/core/models/user_model.dart';

class HomeViewModel extends BaseViewModel {
  UserModel _user = UserModel();

  // Getters
  UserModel get user => _user;

  // Setters
  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }

  void onInit(BuildContext context) {
    var arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    user = arguments['user'];
  }
}
