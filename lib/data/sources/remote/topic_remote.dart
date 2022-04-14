import 'package:flutter_sakura_base/data/models/TopicModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/api/api.dart';
import 'api_path.dart';

final topicRemoteProvider = Provider<TopicRemote>(
  (ref) {
    return TopicRemote();
  },
);

class TopicRemote {
  final ApiClient _client = ApiClient();

  Future<List<TopicModel>> getList(String topicType) async {
    final pragma = {
      'topicType': topicType,
    };

    final response = await _client.invokeAPI(
      ApiPath.topic,
      apiMethod: ApiMethod.get,
      queryParameters: pragma,
    );

    return TopicModel.listFormJson(response.data!['data']['data']);
  }
}
