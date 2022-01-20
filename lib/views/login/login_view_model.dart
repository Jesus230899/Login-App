import 'package:flutter/material.dart';
import 'package:login_app/core/base/base_view_model.dart';
import 'package:login_app/core/models/user_model.dart';
import 'package:login_app/data/users.dart';
import 'package:login_app/views/home/home_view.dart';

class LoginViewModel extends BaseViewModel {
  var formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _loader = false;

  // Getters
  bool get obscurePassword => _obscurePassword;
  bool get loader => _loader;

  // Setters
  set obscurePassword(bool value) {
    _obscurePassword = value;
    notifyListeners();
  }

  set loader(bool value) {
    _loader = value;
    notifyListeners();
  }

  void changeAutoValidateMode(AutovalidateMode value) {
    autoValidateMode = value;
    notifyListeners();
  }

  void onPressedLogin(BuildContext context) {
    if (formKey.currentState.validate()) {
      loader = true;
      Future.delayed(const Duration(seconds: 3)).then((value) {
        if (getUser() == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Usuario no encontrado',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center),
            ),
          );
          loader = false;
        } else {
          Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName,
              ModalRoute.withName(HomeView.routeName),
              arguments: {"user": getUser()});
          loader = false;
        }
      });
    } else {
      changeAutoValidateMode(AutovalidateMode.always);
    }
  }

  UserModel getUser() {
    List<UserModel> temp = [];
    for (var element in users) {
      temp.add(UserModel.fromJson(element));
    }
    for (int i = 0; i < temp.length; i++) {
      if (emailController.text == temp[i].email &&
          passwordController.text == temp[i].password) {
        return temp[i];
      } else {
        return null;
      }
    }
  }
}
