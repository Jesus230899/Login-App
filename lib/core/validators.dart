String emailValidator(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(email)) {
    return null;
  }
  return 'Correo inválido';
}

// final RegExp regex =
//   RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//   if (!regex.hasMatch(value!))
//       return 'Enter a valid email';
//   else
//       return null;
// } else {
//   return 'Enter a valid email';
// }

String passwordValidator(String password) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*_~.,;:+=]).{8,}$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(password)) {
    return null;
  }
  return 'Contraseña inválida';
}
