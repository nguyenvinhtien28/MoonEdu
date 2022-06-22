import 'package:flutter_sakura_base/data/models/QuestionsModel.dart';

class TopGameModel {
  TopGameModel(this.id, this.name, this.questions);

  final int id;
  final String name;
  final List<Question> questions;
}
