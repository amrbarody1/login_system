
class LoginModule {
  final String email;
  final String password;

  LoginModule({this.email, this.password});

  factory LoginModule.fromJson(Map<String, dynamic> json) {
    return LoginModule(
      email: json['email'],
      password: json['password'],
    );
  }
}