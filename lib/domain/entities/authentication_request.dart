import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/exceptions/exceptions.dart';

@immutable
class AuthenticationRequest extends Equatable {
  final String username;
  final String password;

  AuthenticationRequest(this.username, this.password) {
    if (username.isEmpty) {
      throw NotFoundException('userName');
    }

    if (password.isEmpty) {
      throw NotFoundException("password");
    }
  }

  @override
  List<Object> get props => [username, password];
}
