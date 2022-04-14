import 'package:flutter_sakura_base/data/models/TopicModel.dart';
import 'package:flutter_sakura_base/domain/entities/history.dart';

class HistoryModel extends History {
  final String? sId;
  final int? point;
  final int? createdBy;
  final String? updatedAt;

  const HistoryModel({
    this.sId,
    String? name,
    TopicModel? topic,
    this.point,
    String? createdAt,
    String? description,
    this.createdBy,
    int? id,
    this.updatedAt,
  }) : super(
            createdAt: createdAt,
            name: name,
            description: description,
            id: id,
            topic: topic);

  factory HistoryModel.fromJson(dynamic json) {
    return HistoryModel(
      sId: json['_id'],
      name: json['name'],
      topic: TopicModel.fromJson(json['topic']),
      point: json['point'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      id: json['id'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    if (topic != null) {
      map['topic'] = topic;
    }
    map['point'] = point;
    map['createdAt'] = createdAt;
    map['createdBy'] = createdBy;
    map['id'] = id;
    map['updatedAt'] = updatedAt;
    return map;
  }

  static List<HistoryModel> listFormJson(dynamic list) {
    return list.map<HistoryModel>(HistoryModel.fromJson).toList();
  }
}
