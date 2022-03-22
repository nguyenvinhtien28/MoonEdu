import '../../domain/entities/authentication_change_info.dart';

class AuthenticationChangeInfoModel extends AuthenticationChangeInfo {
  const AuthenticationChangeInfoModel({
    int? id,
    String? userName,
    String? password,
    String? name,
    String? birth,
    String? data,
    String? gender,
    String? address,
    String? email,
  }) : super(
          id: id,
          userName: userName,
          password: password,
          name: name,
          birth: birth,
          data: data,
          gender: gender,
          address: address,
          email: email,
        );

  factory AuthenticationChangeInfoModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationChangeInfoModel(
      id: json['id'],
      userName: json['userName'],
      password: json['password'],
      name: json['name'],
      birth: json['birth'],
      data: json['data'],
      gender: json['gender'],
      address: json['address'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['password'] = password;
    data['name'] = name;
    data['birth'] = birth;
    data['data'] = data;
    data['gender'] = gender;
    data['address'] = address;
    data['email'] = email;
    return data;
  }
}
