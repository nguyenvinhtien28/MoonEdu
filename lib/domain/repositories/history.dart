import 'package:flutter_sakura_base/data/models/HistoryModel.dart';
import 'package:flutter_sakura_base/domain/entities/add_history_request.dart';
import 'package:flutter_sakura_base/domain/entities/history.dart';

abstract class HistoryRepository {
  Future<List<History>> getList();
  Future<HistoryModel> create(AddHistoryRequest history);
}