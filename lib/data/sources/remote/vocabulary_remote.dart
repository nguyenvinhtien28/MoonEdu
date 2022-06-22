import 'package:flutter_sakura_base/data/models/VocabularyModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/api/api.dart';
import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../core/services/secure_storage/storage_parh.dart';
import 'api_path.dart';

final vocabularyRemoteProvider = Provider<VocabularyRemote>(
  (ref) {
    return VocabularyRemote();
  },
);

class VocabularyRemote {
  final ApiClient _client = ApiClient();

  Future<List<VocabularyModel>> getList(String vocabType) async {
    final token = await SecureStorageHelper().read(StoragePath.token);
    final pragma = {
      'vocabType': vocabType,
      'token': token,
    };

    final response = await _client.invokeAPI(
      ApiPath.vocabulary,
      apiMethod: ApiMethod.get,
      queryParameters: pragma,
    );

    return VocabularyModel.listFormJson(response.data!['data']['data']);
  }
}
