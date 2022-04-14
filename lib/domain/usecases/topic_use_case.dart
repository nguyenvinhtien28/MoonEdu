import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/data/repositories/topic_repository_impl.dart';
import 'package:flutter_sakura_base/domain/entities/topic.dart';
import 'package:flutter_sakura_base/domain/repositories/topic.dart';
import 'package:flutter_sakura_base/domain/usecases/use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getListTopicUseCaseProvider = Provider<GetTopicsUseCase>((ref) {
  final topicRepository = ref.watch(topicRepositoryProvider);

  return GetTopicsUseCase(topicRepository);
});

class GetTopicsUseCase implements UseCase<List<Topic>, TopicTypeParams> {
  final TopicRepository _topicRepository;

  GetTopicsUseCase(this._topicRepository);

  @override
  Future<List<Topic>> call({required TopicTypeParams params}) {
    try {
      return _topicRepository.getList(params.topicType);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}

class TopicTypeParams {
  final String topicType;

  TopicTypeParams(this.topicType);
}
