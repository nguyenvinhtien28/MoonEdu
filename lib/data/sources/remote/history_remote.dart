import 'package:flutter_sakura_base/data/models/HistoryModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/api/api.dart';
import '../../../domain/entities/add_history_request.dart';
import 'api_path.dart';

final historyRemoteProvider = Provider<HistoryRemote>(
  (ref) {
    return HistoryRemote();
  },
);

class HistoryRemote {
  final ApiClient _client = ApiClient();

  Future<List<HistoryModel>> getList() async {
    // final pragma = {
    //   'name' : 'admin',
    // };

    final response = await _client.invokeAPI(
      ApiPath.histories,
      apiMethod: ApiMethod.get,
      // queryParameters: pragma,
    );

    return HistoryModel.listFormJson(response.data!['data']['data']);
  }

  Future<HistoryModel> create(AddHistoryRequest request) async {
    final postData = {
      'name': request.name,
      'topic': request.topic,
      'point': request.point,
    };

    final response = await _client.invokeAPI(
      ApiPath.createHistory,
      apiMethod: ApiMethod.post,
      bodyData: postData,
    );
    return HistoryModel.fromJson(response.data!['data']);
  }
}
