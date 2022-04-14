import 'package:equatable/equatable.dart';
import 'package:flutter_sakura_base/domain/entities/topic.dart';

class History extends Equatable {
  const History({
    this.topic,
    this.id,
    this.name,
    this.description,
    this.createdAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? createdAt;
  final Topic? topic;

  @override
  List<Object?> get props => [id, name, description];

  @override
  bool get stringify => true;
}

@override
bool get stringify => true;

@override
// TODO: implement props
List<Object?> get props => throw UnimplementedError();
