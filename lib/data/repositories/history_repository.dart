import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/data/models/HistoryModel.dart';
import 'package:flutter_sakura_base/data/sources/remote/history_remote.dart';
import 'package:flutter_sakura_base/domain/entities/add_history_request.dart';
import 'package:flutter_sakura_base/domain/entities/history.dart';
import 'package:flutter_sakura_base/domain/repositories/history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyRepositoryProvider = Provider<HistoryRepositoryIml>(
  (ref) {
    final historyRemote = ref.read(historyRemoteProvider);
    return HistoryRepositoryIml(historyRemote);
  },
);

/// giao tiếp với server or local
class HistoryRepositoryIml implements HistoryRepository {
  final HistoryRemote _historyRemote;

  HistoryRepositoryIml(this._historyRemote);

  @override
  Future<List<History>> getList() async {
    try {
      return await _historyRemote.getList();
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  @override
  Future<HistoryModel> create(AddHistoryRequest history) async {
    try {
      return await _historyRemote.create(history);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
