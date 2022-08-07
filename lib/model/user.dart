import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.email,
    required this.token,
  });

  String name;
  String email;

  String token;

  String applicationDirPath = "";

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        token: json["token"],
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


// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? password;
//   String? passwordConfirm;
//   String? token;
//   String? phone;

//   User(
//       {this.id,
//       this.name,
//       this.email,
//       this.password,
//       this.passwordConfirm,
//       this.token,
//       this.phone});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     password = json['password'];
//     passwordConfirm = json['passwordConfirm'];
//     token = json['token'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['passwordConfirm'] = this.passwordConfirm;
//     data['token'] = this.token;
//     data['phone'] = this.phone;
//     return data;
//   }
// }
