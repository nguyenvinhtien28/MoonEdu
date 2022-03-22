import 'package:auto_route/auto_route.dart';
import 'package:flutter_sakura_base/presentation/view_models/view_model.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final vocabularyViewModel =
    ChangeNotifierProvider.autoDispose.family<VocabularyViewModel, StackRouter>(
  (ref, router) => VocabularyViewModel(ref.read, router),
);

class VocabularyViewModel extends ViewModel {
  VocabularyViewModel(this.read, this.router) : super(read);
  final Reader read;
  final StackRouter router;
  FlutterTts flutterTts = FlutterTts();
  Future<void> readingVocabulary(String vocabulary) async {
    await flutterTts.setLanguage("en-US");
    flutterTts.speak(vocabulary);
  }
}
