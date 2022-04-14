import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/domain/entities/vocabulary.dart';
import 'package:flutter_sakura_base/domain/usecases/use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/vocabulary_repository.dart';
import '../repositories/vocabulary.dart';

final getListVocabularyUseCaseProvider = Provider<GetVocabularyUseCase>((ref) {
  final vocabularyRepository = ref.watch(vocabularyRepositoryProvider);

  return GetVocabularyUseCase(vocabularyRepository);
});

class GetVocabularyUseCase
    implements UseCase<List<Vocabulary>, VocabularyTypeParams> {
  final VocabularyRepository _vocabularyRepository;

  GetVocabularyUseCase(this._vocabularyRepository);

  @override
  Future<List<Vocabulary>> call({required VocabularyTypeParams params}) {
    try {
      return _vocabularyRepository.getList(params.topicType);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

}

class VocabularyTypeParams {
  final String topicType;
  VocabularyTypeParams(this.topicType);
}
