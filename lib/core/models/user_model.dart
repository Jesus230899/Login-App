class UserModel {
  UserModel({
    this.name,
    this.email,
    this.password,
    this.token,
  });

  String name;
  String email;
  String password;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        token: json['token'],
      );
}
