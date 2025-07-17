class UserModel {
  String? fullName;
  String? email;
  String? token;
  String? city;
  String? state;
  String? locality;
  String? password;
  String? confirmNewPassword;
  String? otp;
  String? id;
  int? v;

  UserModel({
    this.fullName,
    this.email,
    this.city,
    this.state,
    this.token,
    this.locality,
    this.password,
    this.confirmNewPassword,
    this.otp,
    this.id,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      email: json['email'],
      city: json['city'],
      otp: json['otp'],
      confirmNewPassword: json['confirmPassword'],
      state: json['state'],
      locality: json['locality'],
      password: json['password'],
      id: json['_id'],
      v: json['__v'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'city': city,
      'state': state,
      'otp': otp,
      'confirmPassword': confirmNewPassword,
      'locality': locality,
      'password': password,
      'token': token,
    };
  }
}
