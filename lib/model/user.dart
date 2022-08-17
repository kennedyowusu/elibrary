import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.email,
    required this.token,
    this.id,
  });

  int? id;
  String name;
  String email;
  String token;

// Function to convert json data to user object
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['user']['id'],
        name: json['user']['name'],
        email: json['user']['email'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "token": token,
      };

  @override
  String toString() {
    return 'User{ name: $name, email: $email, token: $token}';
  }
}
