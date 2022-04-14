import 'package:equatable/equatable.dart';

class Vocabulary extends Equatable {
  const Vocabulary({
    this.sId,
    this.english,
    this.vietnamese,
    this.pronunce,
  });

  final String? sId;
  final String? english;
  final String? vietnamese;
  final String? pronunce;

  @override
  List<Object?> get props => [sId, english, vietnamese, pronunce];

  @override
  bool get stringify => true;
}
