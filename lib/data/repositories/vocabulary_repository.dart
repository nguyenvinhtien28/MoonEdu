import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/domain/entities/vocabulary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repositories/vocabulary.dart';
import '../sources/remote/vocabulary_remote.dart';

final vocabularyRepositoryProvider = Provider<VocabularyRepositoryIml>(
  (ref) {
    final vocabularyRemote = ref.read(vocabularyRemoteProvider);
    return VocabularyRepositoryIml(vocabularyRemote);
  },
);

/// giao tiếp với server or local
class VocabularyRepositoryIml implements VocabularyRepository {
  final VocabularyRemote _vocabularyRemote;

  VocabularyRepositoryIml(this._vocabularyRemote);

  @override
  Future<Vocabulary> create(Vocabulary vocabulary) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<Vocabulary>> getList(String vocabulary) async {
    try {
      return await _vocabularyRemote.getList(vocabulary);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
