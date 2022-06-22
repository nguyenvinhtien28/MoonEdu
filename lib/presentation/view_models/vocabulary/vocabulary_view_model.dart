import 'package:flutter_sakura_base/domain/entities/vocabulary.dart';
import 'package:flutter_sakura_base/presentation/view_models/view_model.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/vocabulary_use_case.dart';

final vocabularyViewModel =
    ChangeNotifierProvider.autoDispose<VocabularyViewModel>(
  (ref) => VocabularyViewModel(ref.read),
);

class VocabularyViewModel extends ViewModel {
  VocabularyViewModel(this.read) : super(read);
  final Reader read;
  FlutterTts flutterTts = FlutterTts();

  GetVocabularyUseCase get getVocabulary =>
      read(getListVocabularyUseCaseProvider);
  List<Vocabulary> listVocabularyPrivate = [];
  List<Vocabulary> listVocabularyPublic = [];
  Future initPublic() async {
    final params = VocabularyTypeParams('public');
    final topicsUseCase = await getVocabulary.call(params: params);
    print(topicsUseCase.toString());
    print(topicsUseCase.first.vietnamese);
    listVocabularyPublic = topicsUseCase;
    print("-----------------$listVocabularyPublic");
    print("-----------------${listVocabularyPublic.first.pronunce.toString()}");
    notifyListeners();
  }

  Future initPrivate() async {
    final params = VocabularyTypeParams('private');
    final topicsUseCase = await getVocabulary.call(params: params);
    print(topicsUseCase.toString());
    listVocabularyPrivate = topicsUseCase;
    print("-----------------$listVocabularyPrivate");
    notifyListeners();
  }

  Future<void> readingVocabulary(String vocabulary) async {
    await flutterTts.setLanguage("en-US");
    flutterTts.speak(vocabulary);
  }
}
