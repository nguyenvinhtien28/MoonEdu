import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/data/models/AuthenticationQuestionsModel.dart';
import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:flutter_sakura_base/presentation/view_models/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final questionViewModel =
    ChangeNotifierProvider.autoDispose<QuestionViewModel>((ref) {
  return QuestionViewModel(ref.read);
});

class QuestionViewModel extends ViewModel {
  QuestionViewModel(this.read) : super(read);

  final Reader read;
  int _endTime = 30;

  int get endTime => _endTime;

  set endTime(int time) {
    _endTime = time;
    notifyListeners();
  }

  int _timeTicker = 0;

  int get timeTicker => _timeTicker;

  set timeTicker(int timeTicker) {
    _timeTicker = timeTicker;
    notifyListeners();
  }

  late AnimationController _animationController;

  AnimationController get animationController => _animationController;

  double _animation = 0.0;

  double get animation => _animation;

  final _pageController = PageController();

  PageController get pageController => _pageController;

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  set isAnswered(bool answered) {
    _isAnswered = answered;
    notifyListeners();
  }

  int _correctAns = 0;

  int get correctAns => _correctAns;

  set correctAns(int correctAns) {
    _correctAns = correctAns;
    notifyListeners();
  }

  bool _selected = true;

  bool get selected => _selected;

  set selected(bool selected) {
    _selected = selected;
    notifyListeners();
  }

  int _selectedAns = 0;

  int get selectedAns => _selectedAns;

  set selectedAns(int selectedAns) {
    _selectedAns = selectedAns;
    notifyListeners();
  }

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  int _questionNumber = 1;

  set questionNumber(int question) {
    _questionNumber = question;
    notifyListeners();
  }

  Future onInit() async {
    _animationController = useAnimationController(
      duration: const Duration(seconds: 20),
    );
    _animation = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(animationController),
    );
    useEffect(
      () {
        animationController.forward().whenComplete(() {
          nextQuestion();
          animationController.reset();
          animationController.forward().whenComplete(nextQuestion);
        });
        return null;
      },
      [animationController],
    );
  }

  Future checkAns(Question question, int selectedIndex) async {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    _selected = false;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _animationController.stop();

    notifyListeners();
  }

  Future nextQuestion() async {
    if (_questionNumber != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      router.pop(const HomeRoute());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber = index + 1;
  }
}
