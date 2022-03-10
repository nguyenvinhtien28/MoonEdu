library exception_handle;

import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sakura_base/ui/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/api.dart';

part 'generic_exception.dart';

///
/// [ExceptionType] is an exception definition
///
enum ExceptionType {
  warn, // no designation
  alert, // alert (send a message to the user)
  forbidden, // authority error
  notFoundError, // couldn't find it.
  validationError, // validation error
  unauthorizedError, // authentication error
  serverError, // server error
  fatal, // fatal
  forcedUpdate, // Forced version upgrades are mandatory.
}

/// Release judgment (for debugging handling only)
const isRelease = bool.fromEnvironment('dart.vm.product');

final exceptionHandleProvider = Provider(
  (ref) => ExceptionHandle(ref.read),
);

class ExceptionHandle {
  const ExceptionHandle(this.read) : super();

  final Reader read;

  StackRouter get router => useRouter();

  ///
  /// Common exception handling
  ///
  void handler(dynamic e) async {
    // GenericException
    if (e is GenericException) {
      switch (e.code) {
        case ExceptionType.alert:
          await alertHandler(e.message);
          break;

        case ExceptionType.unauthorizedError:
          _unauthorizedErrorHandler();
          break;

        case ExceptionType.forbidden:
          _forbiddenHandler();
          break;

        case ExceptionType.fatal:
          _fatalHandler();
          break;

        case ExceptionType.notFoundError:
          _notFoundErrorHandler();
          break;

        case ExceptionType.validationError:
          _validationErrorHandler(e.message);
          break;

        case ExceptionType.serverError:
          _serverErrorHandler();
          break;

        case ExceptionType.forcedUpdate:
          forcedUpdateHandler();
          break;

        case ExceptionType.warn:
          assert(throw Exception(e.toString()));
          break;

        default:
      }
    } else {
      /// We need you to solve a problem
      /// We're having with Repository or Application.
      assert(throw Exception('Please fix: ${e.toString()}'));
    }
    debugPrint(e.toString());
  }

  ///
  /// Exception (alert)
  /// Display an alert dialog
  ///
  Future<void> alertHandler(
    String message, {
    String title = 'Error',
  }) async {
    /// TODO: showErrorMessageDialog
  }

  ///
  /// Exception (authentication error)
  /// Transit to login page
  ///
  void _unauthorizedErrorHandler() {
    /// TODO: deleteSecurityToken
    router.replaceAll([const LoginRoute()]);
  }

  ///
  /// Permission error
  /// Transition to the `403` page
  ///
  void _forbiddenHandler() {
    if (isRelease) {
      /// TODO: deleteSecurityToken
      /// router.replaceAll([const ForbiddenRoute()])
    } else {
      assert(throw Exception('Please fix the problem'));
    }
  }

  ///
  /// Exception (fatal)
  /// Transition to the `403` page
  ///
  void _fatalHandler() {
    if (isRelease) {
      /// TODO: deleteSecurityToken
      /// router.replaceAll([const ForbiddenRoute()])
    } else {
      assert(throw Exception('Please fix the problem'));
    }
  }

  ///
  /// Exception (Not Find)
  /// Transition to the `404` page
  ///
  void _notFoundErrorHandler() {
    /// TODO: router.replaceAll([const NotFoundRoute()])
  }

  ///
  /// Exception (validation error)
  /// Display an alert dialog
  ///
  void _validationErrorHandler(String message) {
    final _message = message.isNotEmpty
        ? message
        : 'There is an invalid input value. Please check your input.';

    alertHandler(_message);
  }

  ///
  /// Exception (server error)
  /// Display an alert dialog
  ///
  void _serverErrorHandler() {
    alertHandler(
      'Please check the communication status and try again.',
      title: 'No response',
    );
  }

  ///
  /// Forced version upgrade
  ///
  void forcedUpdateHandler() {
    /// TODO: router.replaceAll([const ForcedUpdateRoute()])
  }
}
