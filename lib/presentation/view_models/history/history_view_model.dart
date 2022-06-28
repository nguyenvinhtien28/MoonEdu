import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/domain/usecases/history/add_history.dart';
import 'package:flutter_sakura_base/presentation/view_models/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/entities/history.dart';
import '../../../domain/usecases/history/history_use_case.dart';
import '../../../domain/usecases/use_case.dart';
import '../../route/router.dart';

final historyViewModelProvider =
    ChangeNotifierProvider.autoDispose<HistoryViewModel>(
  (ref) {
    return HistoryViewModel(ref.read);
  },
);
enum _HistoryViewModel {
  failed, // Login failure
  connectionError, // off-line
}
class HistoryViewModel extends ViewModel {
  HistoryViewModel(this.read) : super(read);
  final Reader read;

  GetHistoryUseCase get getHistory => read(getListHistoryUseCaseProvider);
  AddHistoryUseCase get addHistory => read(addListHistoryUseCaseProvider);
  List<History> list = [];
  String errorMessage = "";

  Future init() async {
    final historyUseCase = await getHistory.call(params: NoParam());
    list = historyUseCase;
    list.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

  Future<void> createHistory(int topic) async {
    try {
      if (!await isOnline()) {
        errorMessage = _getErrorMessage(_HistoryViewModel.connectionError);
        notifyListeners();
        return;
      }
      final params = AddHistoryParam(topic: topic, name: 'test', point: 10);

      await addHistory.call(params: params);
      router.replace(const QuizRoute());

    } catch (e) {
      errorMessage = _getErrorMessage(_HistoryViewModel.failed);
      notifyListeners();
      if (e is GenericException && e.code == ExceptionType.forcedUpdate) {
        handleExceptions(e);
        debugPrint('-------------------> ' + e.message);
      }
    }
  }

  String _getErrorMessage(_HistoryViewModel errorStatus) {
    switch (errorStatus) {
      case _HistoryViewModel.connectionError:
        return "The network is not connected.";

      case _HistoryViewModel.failed:
        return "One of the input items is incorrect. "
            "Please check the input details and enter again.";

      default:
        return "";
    }
  }
}
