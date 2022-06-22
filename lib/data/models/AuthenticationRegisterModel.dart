import 'package:flutter_sakura_base/domain/entities/authentication_register.dart';

class AuthenticationRegisterModel extends AuthenticationRegister {
  const AuthenticationRegisterModel({
    String? userName,
    String? password,
    String? email,
    String? birth,
    List<int>? permission,
    int? createdAt,
    String? sId,
    String? token,
    int? id,
    int? iV,
  }) : super(
            userName: userName,
            password: password,
            email: email,
            birth: birth,
            permission: permission,
            createdAt: createdAt,
            sId: sId,
            token: token,
            id: id,
            iV: iV);

  factory AuthenticationRegisterModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationRegisterModel(
      userName: json['userName'],
      password: json['password'],
      email: json['email'],
      birth: json['birth'],
      createdAt: json['createdAt'],
      permission: json['permission'].cast<int>(),
      sId: json['_id'],
      id: json['id'],
      token: json['token'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    data['email'] = email;
    data['birth'] = birth;
    data['permission'] = permission;
    data['createdAt'] = createdAt;
    data['id'] = sId;
    data['token'] = token;
    data['id'] = id;
    data['v'] = iV;
    return data;
  }
}
