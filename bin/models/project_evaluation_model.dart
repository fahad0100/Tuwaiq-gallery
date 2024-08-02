import '../helper/validations/validations.dart';

class ProjectEvaluation {
  ProjectEvaluation({
    this.idea,
    this.design,
    this.tools,
    this.practices,
    this.presentation,
    this.investment,
    this.note,
    this.userId,
    this.projectId,
  });
  num? idea;
  num? design;
  num? tools;
  num? practices;
  num? presentation;
  num? investment;
  String? note;
  String? userId;
  String? projectId;

  ProjectEvaluation.fromJson(Map<String, dynamic> json) {
    idea = Validation.isValidRatingValue(
        value: json['idea'].toString(), title: 'Idea rating');

    design = Validation.isValidRatingValue(
        value: json['design'].toString(), title: 'Design rating');

    tools = Validation.isValidRatingValue(
        value: json['tools'].toString(), title: 'Tools rating');

    practices = Validation.isValidRatingValue(
        value: json['practices'].toString(), title: 'Practices rating');

    presentation = Validation.isValidRatingValue(
        value: json['presentation'].toString(), title: 'Presentation rating');

    investment = Validation.isValidRatingValue(
        value: json['investment'].toString(), title: 'Investment rating');

    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idea'] = idea;
    data['design'] = design;
    data['tools'] = tools;
    data['practices'] = practices;
    data['presentation'] = presentation;
    data['investment'] = investment;
    data['comment'] = note;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
