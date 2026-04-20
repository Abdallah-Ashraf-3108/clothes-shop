class LoginResponseModel {
  final String? token;
  final String? message;
  final UserData? user;

  LoginResponseModel({
    this.token,
    this.message,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      message: json['message'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "message": message,
      "user": user?.toJson(),
    };
  }
}

class UserData {
  final String? name;
  final String? email;
  final String? role;
  final String? profileImg;
  final String? id;

  UserData({
    this.name,
    this.email,
    this.role,
    this.profileImg,
    this.id,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      role: json['role'],
      profileImg: json['profileImg'],
      id: json['id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "role": role,
      "profileImg": profileImg,
      "id": id,
    };
  }
}
