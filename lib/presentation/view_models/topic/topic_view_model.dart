import 'package:flutter_sakura_base/domain/usecases/history/history_use_case.dart';
import 'package:flutter_sakura_base/domain/usecases/topic_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/topic.dart';
import '../view_model.dart';

final topicVMProvider = ChangeNotifierProvider.autoDispose<TopicViewModel>(
  (ref) {
    return TopicViewModel(ref.read);
  },
);

class TopicViewModel extends ViewModel {
  TopicViewModel(this.read) : super(read);

  final Reader read;

  GetTopicsUseCase get getTopic => read(getListTopicUseCaseProvider);

  GetHistoryUseCase get getHistory => read(getListHistoryUseCaseProvider);
  List<Topic> listTopicPrivate = [];
  List<Topic> listTopicPublic = [];

  Future initPublic() async {
    final params = TopicTypeParams('public');
    final topicsUseCase = await getTopic.call(params: params);
    print(topicsUseCase.toString());
    print(topicsUseCase.first.name);
    listTopicPublic = topicsUseCase;
    print("-----------------$listTopicPublic");
    print("-----------------${listTopicPublic[1]..toString()}");
    notifyListeners();
  }

  Future initPrivate() async {
    final params = TopicTypeParams('private');
    final topicsUseCase = await getTopic.call(params: params);
    print(topicsUseCase.toString());
    listTopicPrivate = topicsUseCase;
    print("-----------------$listTopicPrivate");
    notifyListeners();
  }

  Future selectionTopic() async {}
}
