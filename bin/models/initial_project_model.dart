import '../helper/validations/validations.dart';

class InitialProjectModel {
  InitialProjectModel({
    this.userId,
    this.timeEndEdit,
    this.allowEdit = true,
  });
  String? userId;
  String? adminId;
  String? timeEndEdit;
  bool? allowEdit;
  bool? allowRating;
  bool? isPublic;

  InitialProjectModel.fromJson(Map<String, dynamic> json) {
    userId = Validation.validateUuid(
        value: Validation.isValidNotNull(
                value: json['user_id'].toString(), title: "User ID")
            .toString(),
        title: "User id")!;
    timeEndEdit = Validation.convertToDateToSupabase(
      date: json['time_end_edit'],
      title: "End Data edit is required",
    );
    allowEdit = Validation.isValidBoolean(
        value: json['edit'].toString(), title: 'allow edit');
  }

  InitialProjectModel.fromToUpdate(Map<String, dynamic> json) {
    isPublic = Validation.isValidBoolean(
        value: json['public'].toString(), title: 'is public');
    allowEdit = Validation.isValidBoolean(
        value: json['edit'].toString(), title: 'allow edit');
    timeEndEdit = Validation.convertToDateToSupabase(
      date: json['time_end_edit'],
      title: "End Data edit is required",
    );
    allowRating = Validation.isValidBoolean(
        value: json['rating'].toString(), title: 'allow rating');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['admin_id'] = adminId;
    data['time_end_edit'] = timeEndEdit;
    data['allow_edit'] = allowEdit;
    data['is_public'] = isPublic;
    data['allow_rating'] = allowRating;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
