class LoginResponseModel {
  final String? accessToken;
  final String? refreshToken;
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  LoginResponseModel({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
      "id": id,
      "username": username,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "image": image,
    };
  }
}
