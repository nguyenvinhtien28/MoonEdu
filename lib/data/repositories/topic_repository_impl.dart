import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/data/sources/remote/topic_remote.dart';
import 'package:flutter_sakura_base/domain/entities/topic.dart';
import 'package:flutter_sakura_base/domain/repositories/topic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topicRepositoryProvider = Provider<TopicRepositoryIml>(
  (ref) {
    final topicRemote = ref.read(topicRemoteProvider);
    return TopicRepositoryIml(topicRemote);
  },
);

/// giao tiếp với server or local
class TopicRepositoryIml implements TopicRepository {
  final TopicRemote _topicRemote;

  TopicRepositoryIml(this._topicRemote);

  @override
  Future<Topic> create(Topic topic) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<Topic>> getList(String topicType) async {
    try {
      return await _topicRemote.getList(topicType);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
