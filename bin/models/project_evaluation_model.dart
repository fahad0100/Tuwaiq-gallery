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
    idea = json['idea'] ?? 0;
    design = json['design'] ?? 0;
    tools = json['tools'];
    practices = json['practices'] ?? 0;
    presentation = json['presentation'] ?? 0;
    investment = json['investment'] ?? 0;
    note = json['note'];
    userId = json['user_id'];
    projectId = json['project_id'];
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
