import 'package:equatable/equatable.dart';

/// thực thể tương tác với UI
///
class AuthenticationAddVocabulary extends Equatable {
  const AuthenticationAddVocabulary({
    this.english,
    this.vietnamese,
    this.pronunce,
    this.vocabType,
    this.createdAt,
    this.createdBy,
    this.sId,
    this.id,
    this.iV,
  });

  final String? english;
  final String? vietnamese;
  final String? pronunce;
  final String? vocabType;
  final String? createdAt;
  final int? createdBy;
  final String? sId;
  final int? id;
  final int? iV;

  @override
  List<Object?> get props => [
    english,
    vietnamese,
    pronunce,
    vocabType,
    vocabType,
    createdAt,
    createdBy,
    sId,
    id,
    iV,
      ];

  @override
  bool get stringify => true;
}
