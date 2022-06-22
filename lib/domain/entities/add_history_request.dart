import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../core/exceptions/exceptions.dart';

@immutable
class AddHistoryRequest extends Equatable {

  final String name;
  final int topic;
  final int point;

  AddHistoryRequest(
      this.name,
      this.topic,
      this.point,
      ) {
    if (name.isEmpty) {
      throw NotFoundException('name');
    }

    if (topic == 0) {
      throw NotFoundException('topic');
    }

    if (point == 0) {
      throw NotFoundException('point');
    }
  }

  @override
  List<Object?> get props => [name, topic, point];

}