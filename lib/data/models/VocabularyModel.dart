import 'package:flutter_sakura_base/domain/entities/vocabulary.dart';

class VocabularyModel extends Vocabulary {
  const VocabularyModel({
    String? sId,
    String? english,
    String? vietnamese,
    String? pronunce,
    this.vocabType,
    this.createdAt,
    this.createdBy,
    this.id,
    this.iV,
  }) : super(
            sId: sId,
            english: english,
            vietnamese: vietnamese,
            pronunce: pronunce);
  final String? vocabType;
  final String? createdAt;
  final int? createdBy;
  final int? id;
  final int? iV;

  factory VocabularyModel.fromJson(Map<String, dynamic> json) {
    return VocabularyModel(
      english: json['english'],
      vietnamese: json['vietnamese'],
      pronunce: json['pronunce'],
      vocabType: json['vocabType'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      sId: json['_id'],
      id: json['id'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['english'] = english;
    data['vietnamese'] = vietnamese;
    data['pronunce'] = pronunce;
    data['vocabType'] = vocabType;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['_id'] = sId;
    data['id'] = id;
    data['__v'] = iV;
    return data;
  }
  static List<VocabularyModel> listFormJson(List<dynamic> json){
    return json.map((e) {
      return VocabularyModel.fromJson(e);
    }).toList();
  }
}
