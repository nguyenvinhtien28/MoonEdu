import '../../domain/entities/authentication_user.dart';

class AuthenticationUserModel extends AuthenticationUser {
  const AuthenticationUserModel({
    String? sId,
    String? name,
    String? userName,
    String? password,
    String? email,
    String? gender,
    String? address,
    String? birth,
    List<int>? permission,
    String? avatar,
    String? createdAt,
    String? token,
    int? id,
    int? iV,
    String? updatedAt,
  }) : super(
          id: id,
          sId: sId,
          name: name,
          userName: userName,
          password: password,
          email: email,
          gender: gender,
          address: address,
          birth: birth,
          permission: permission,
          avatar: avatar,
          createdAt: createdAt,
          token: token,
          iV: iV,
          updatedAt: updatedAt,
        );

  factory AuthenticationUserModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationUserModel(
      sId: json['_id'],
      name: json['name'],
      userName: json['userName'],
      password: json['password'],
      email: json['email'],
      gender: json['gender'],
      address: json['address'],
      birth: json['birth'],
      permission: json['permission'].cast<int>(),
      avatar: json['avatar'],
      createdAt: json['createdAt'],
      token: json['token'],
      id: json['id'],
      iV: json['__v'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['userName'] = userName;
    data['password'] = password;
    data['email'] = email;
    data['gender'] = gender;
    data['address'] = address;
    data['birth'] = birth;
    data['permission'] = permission;
    data['avatar'] = avatar;
    data['createdAt'] = createdAt;
    data['token'] = token;
    data['id'] = id;
    data['__v'] = iV;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
