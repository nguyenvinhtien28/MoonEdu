
import 'package:flutter_sakura_base/domain/entities/vocabulary.dart';

abstract class VocabularyRepository {
  Future<List<Vocabulary>> getList(String vocabularyType);
  Future<Vocabulary> create(Vocabulary vocabulary);
}