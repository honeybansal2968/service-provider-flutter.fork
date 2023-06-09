class UserModel {
  final bool success;
  final String message;
  final User user;

  UserModel({
    required this.success,
    required this.message,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'],
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String fullName;
  final String email;
  final String photo;
  final String role;

  User({
    required this.fullName,
    required this.email,
    required this.photo,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      email: json['email'],
      photo: json['photo'],
      role: json['role'],
    );
  }
}

