import 'package:equatable/equatable.dart';

class AuthenticationRegister extends Equatable {
  const AuthenticationRegister({
    required this.userName,
    required this.password,
    required this.email,
    required this.birth,
    required this.permission,
    required this.createdAt,
    required this.sId,
    required this.token,
    required this.id,
    required this.iV,
  });

  final String? userName;
  final String? password;
  final String? email;
  final String? birth;
  final List<int>? permission;
  final int? createdAt;
  final String? sId;
  final String? token;
  final int? id;
  final int? iV;

  @override
  List<Object?> get props => [
    userName,
    password,
    email,
    birth,
    permission,
    createdAt,
    sId,
    token,
    id,
    iV,
  ];

  @override
  bool get stringify => true;
}
