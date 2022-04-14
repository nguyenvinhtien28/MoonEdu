import 'package:equatable/equatable.dart';
import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/data/models/HistoryModel.dart';
import 'package:flutter_sakura_base/data/repositories/history_repository.dart';
import 'package:flutter_sakura_base/domain/entities/add_history_request.dart';
import 'package:flutter_sakura_base/domain/repositories/history.dart';
import 'package:flutter_sakura_base/domain/usecases/use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addListHistoryUseCaseProvider = Provider<AddHistoryUseCase>((ref) {
  final historyRepository = ref.watch(historyRepositoryProvider);

  return AddHistoryUseCase(historyRepository);
});

class AddHistoryUseCase implements UseCase<HistoryModel, AddHistoryParam> {
  final HistoryRepository _historyRepository;

  AddHistoryUseCase(this._historyRepository);

  @override
  Future<HistoryModel> call({required AddHistoryParam params}) {
    try {
      return _historyRepository
          .create(AddHistoryRequest(params.name, params.topic, params.point));
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}

class AddHistoryParam extends Equatable {
  const AddHistoryParam({
    required this.name,
    required this.topic,
    required this.point,
  });

  final String name;
  final int topic;
  final int point;

  @override
  List<Object?> get props => [name, topic, point];
}
