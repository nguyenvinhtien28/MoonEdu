import 'package:equatable/equatable.dart';

class AuthenticationUser extends Equatable {
  const AuthenticationUser(
      {this.sId,
      this.name,
      this.userName,
      this.password,
      this.email,
      this.gender,
      this.address,
      this.birth,
      this.permission,
      this.avatar,
      this.createdAt,
      this.token,
      this.id,
      this.iV,
      this.updatedAt});

  final String? sId;
  final String? name;
  final String? userName;
  final String? password;
  final String? email;
  final String? gender;
  final String? address;
  final String? birth;
  final List<int>? permission;
  final String? avatar;
  final String? createdAt;
  final String? token;
  final int? id;
  final int? iV;
  final String? updatedAt;

  @override
  List<Object?> get props => [
        sId,
        name,
        userName,
        password,
        email,
        gender,
        address,
        birth,
        permission,
        avatar,
        createdAt,
        token,
        id,
        iV,
        updatedAt,
      ];

  @override
  bool get stringify => true;
}
