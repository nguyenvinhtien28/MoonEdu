import 'package:flutter_sakura_base/domain/entities/topic.dart';

class TopicModel extends Topic {
  final int? sId;
  final String? createdAt;
  final int? createdBy;
  final String? updatedAt;
  final int? updatedBy;

  const TopicModel({
    this.sId,
    int? id,
    String? name,
    String? topicType,
    String? description,
    bool? enable,
    String? image,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  }) : super(
          id: id,
          name: name,
          topicType: topicType,
          description: description,
          enable: enable,
          image: image,
        );

  factory TopicModel.fromJson(dynamic json) {
    return TopicModel(
      name: json['name'],
      topicType: json['topicType'],
      description: json['description'],
      enable: json['enable'],
      image: json['image'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      id: json['id'],
      updatedAt: json['updatedAt'],
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = sId;
    map['name'] = name;
    map['topicType'] = topicType;
    map['description'] = description;
    map['enable'] = enable;
    map['image'] = image;
    map['id'] = createdAt;
    map['id'] = createdBy;
    map['id'] = updatedAt;
    map['id'] = updatedBy;
    return map;
  }

 static List<TopicModel> listFormJson(List<dynamic> list){
    return list.map(TopicModel.fromJson).toList();
  }
}
