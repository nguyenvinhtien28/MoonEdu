import 'package:flutter_sakura_base/domain/entities/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getList(String topicType);
  Future<Topic> create(Topic topic);
}