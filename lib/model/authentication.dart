class AuthModel {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  AuthModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  // Method to convert the object (AuthModel) to a Map/JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = confirmPassword;
    return data;
  }
}
