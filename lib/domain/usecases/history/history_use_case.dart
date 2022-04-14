import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/data/repositories/history_repository.dart';
import 'package:flutter_sakura_base/domain/entities/history.dart';
import 'package:flutter_sakura_base/domain/repositories/history.dart';
import 'package:flutter_sakura_base/domain/usecases/use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getListHistoryUseCaseProvider = Provider<GetHistoryUseCase>((ref) {
  final historyRepository = ref.watch(historyRepositoryProvider);

  return GetHistoryUseCase(historyRepository);
});

class GetHistoryUseCase implements UseCase<List<History>, NoParam> {
  final HistoryRepository _historyRepository;

  GetHistoryUseCase(this._historyRepository);

  @override
  Future<List<History>> call({required NoParam params}) {
    try {
      return _historyRepository.getList();
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
