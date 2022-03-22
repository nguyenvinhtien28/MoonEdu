import 'package:equatable/equatable.dart';

class AuthenticationChangeInfo extends Equatable {
  const AuthenticationChangeInfo({
    required this.id,
    required this.userName,
    required this.password,
    required this.email,
    required this.birth,
    required this.name,
    required this.data,
    required this.gender,
    required this.address,
  });

  final int? id;
  final String? userName;
  final String? password;
  final String? name;
  final String? birth;
  final String? data;
  final String? gender;
  final String? address;
  final String? email;

  @override
  List<Object?> get props => [
        userName,
        password,
        name,
        birth,
        data,
        gender,
        address,
        email,
      ];

  @override
  bool get stringify => true;
}
