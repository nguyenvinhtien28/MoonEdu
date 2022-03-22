import '../../domain/entities/authentication_add_vocabulary.dart';

class AuthenticationAddVocabularyModel extends AuthenticationAddVocabulary {
  const AuthenticationAddVocabularyModel({
    String? english,
    String? vietnamese,
    String? pronunce,
    String? vocabType,
    String? createdAt,
    int? createdBy,
    String? sId,
    int? id,
    int? iV,
  }) : super(
          english: english,
          vietnamese: vietnamese,
          pronunce: pronunce,
          vocabType: vocabType,
          createdAt: createdAt,
          createdBy: createdBy,
          sId: sId,
          id: id,
          iV: iV,
        );

  factory AuthenticationAddVocabularyModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationAddVocabularyModel(
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
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
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
}
