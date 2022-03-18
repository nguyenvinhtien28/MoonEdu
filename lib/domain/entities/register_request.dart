import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../core/exceptions/exceptions.dart';

@immutable
class RegistryRequest extends Equatable {

  final String userName;
  final String email;
  final String password;

   RegistryRequest(
     this.userName,
     this.email,
     this.password,
) {
    if (userName.isEmpty) {
      throw NotFoundException('userName');
    }

    if (email.isEmpty) {
      throw NotFoundException('email');
    }

    if (password.isEmpty) {
      throw NotFoundException('password');
    }
  }

  @override
  List<Object?> get props => [userName, email, password];

}