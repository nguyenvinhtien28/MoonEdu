import 'package:flutter_sakura_base/presentation/view_models/view_model.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final vocabularyViewModel =
    ChangeNotifierProvider.autoDispose<VocabularyViewModel>(
  (ref) => VocabularyViewModel(ref.read),
);

class VocabularyViewModel extends ViewModel {
  VocabularyViewModel(this.read) : super(read);
  final Reader read;
  FlutterTts flutterTts = FlutterTts();
  Future<void> readingVocabulary(String vocabulary) async {
    await flutterTts.setLanguage("en-US");
    flutterTts.speak(vocabulary);
  }
}
