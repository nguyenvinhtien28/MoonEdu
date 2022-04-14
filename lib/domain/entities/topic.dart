import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  const Topic({
    this.id,
    this.name,
    this.topicType,
    this.description,
    this.enable,
    this.image,
  });

 final int? id;
 final String? name;
 final String? topicType;
 final String? description;
 final bool? enable;
 final String? image;

  @override
  List<Object?> get props => [id, name, topicType, description, enable, image];

  @override
  bool get stringify => true;
}
