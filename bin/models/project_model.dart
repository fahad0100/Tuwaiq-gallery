import '../helper/validations/validations.dart';

class ProjectModel {
  ProjectModel({
    this.projectId,
    this.projectName,
    this.bootcampName,
    this.startDate,
    this.endDate,
    this.presentationDate,
    this.projectDescription,
    this.projectLogo,
    this.keys,
    this.link,
    this.members,
  });
  String? projectId;
  String? projectName;
  String? bootcampName;
  String? startDate;
  String? endDate;
  String? presentationDate;
  String? projectDescription;
  List<int>? projectLogo;
  List<int>? presentation;
  List<String>? keys;
  List<String>? tags;
  List<List<int>>? images;
  List<Link>? link;
  List<Members>? members;
//----
  String? userId;
  String? type;
  String? adminId;
  String? timeEndEdit;
  bool? allowEdit;
  bool? isPublic;

  ProjectModel.fromJsonRequestEdit(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectName = json['project_name'];
    isPublic = json['is_public'];
    bootcampName = json['bootcamp_name'];
    startDate = Validation.convertToDateToSupabase(
        date: Validation.validateDate(
            value: json['start_date'], title: "Start date"));
    endDate = Validation.convertToDateToSupabase(
        date: Validation.validateDate(
            value: json['end_date'], title: 'End date'));
    presentationDate = Validation.convertToDateToSupabase(
        date: Validation.validateDate(
            value: json['presentation_date'], title: 'Presentation date'));
    projectDescription = json['project_description'];
    projectLogo = List<int>.from(Validation.parseIntList(
            input: json['project_logo'].toString(), title: "Logo")!)
        .toList();
    presentation = List<int>.from(Validation.parseIntList(
        input: json['presentation'].toString(), title: "Presentation")!);
    images = (json['images'] as List<dynamic>)
        .map((e) => List<int>.from(Validation.parseIntList(
            input: e.toString(), title: "One of Images")!))
        .toList();
    keys = List.from(json['keys']);
    tags = List.from(json['tags']);
    link = List.from(json['link']).map((e) => Link.fromJson(e)).toList();
    members =
        List.from(json['members']).map((e) => Members.fromJson(e)).toList();
  }
  fromDataBaseCheckerFirst(Map<String, dynamic> json) {
    userId = json['user_id'];
    adminId = json['admin_id'];
    timeEndEdit = json['time_end_edit'];
    allowEdit = json['allow_edit'];
    isPublic = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['project_name'] = projectName;
    data['bootcamp_name'] = bootcampName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['presentation_date'] = presentationDate;
    data['time_end_edit'] = timeEndEdit;
    data['project_description'] = projectDescription;
    data['project_logo'] = projectLogo;
    data['presentation'] = presentation;
    data['user_id'] = userId;
    data['admin_id'] = adminId;
    data['allow_edit'] = allowEdit;
    data['is_public'] = isPublic;
    data['keys'] = keys;
    data['tags'] = tags;
    data['images'] = images?.map((e) => List<int>.from(e)).toList();
    data['link'] = link?.map((e) => e.toJson()).toList();
    data['members'] = members?.map((e) => e.toJson()).toList();
    return data;
  }

  Map<String, dynamic> toJsonBase() {
    final data = <String, dynamic>{};
    data['project_name'] = projectName;
    data['bootcamp_name'] = bootcampName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['presentation_date'] = presentationDate;
    data['project_description'] = projectDescription;
    data['is_public'] = isPublic;
    return data;
  }

  List toJsonLink() {
    List data = [];
    link?.map((e) {
      data.add({
        "project_id": projectId,
        "type": e.type,
        "url": e.url,
      });
    }).toList();
    return data;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?------------------------Base-------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  ProjectModel.fromJsonBaseRequestEdit(Map<String, dynamic> json) {
    projectId = json['project_id'];
    type = getProjectTypeName(type: json['type']);

    projectName = Validation.isValidNotNull(
        value: json['project_name'].toString(), title: "Name of project");
    bootcampName = Validation.isValidNotNull(
        value: json['bootcamp_name'], title: "Bootcamp name");

    startDate = Validation.convertToDateToSupabase(
        date: Validation.validateDate(
            value: json['start_date'].toString(),
            title: "Start date bootcamp"));
    endDate = Validation.convertToDateToSupabase(
        date: Validation.validateDate(
            value: json['end_date'].toString(), title: 'End date bootcamp'));
    presentationDate = Validation.convertToDateToSupabase(
        date: Validation.validateDate(
            value: json['presentation_date'].toString(),
            title: 'Presentation date'));
    projectDescription = Validation.isValidNotNull(
        value: json['project_description'].toString(), title: "Description");
  }
  Map<String, dynamic> toJsonUpdateBase() {
    final data = <String, dynamic>{};
    data['project_name'] = projectName;
    data['bootcamp_name'] = bootcampName;
    data['start_date'] = startDate;
    data['type'] = type;
    data['end_date'] = endDate;
    data['presentation_date'] = presentationDate;
    data['project_description'] = projectDescription;
    // data['keys'] = keys;
    data.removeWhere((key, value) => value == null);

    return data;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?------------------------Logo-------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  ProjectModel.fromJsonLogoRequestEdit(Map<String, dynamic> json) {
    projectId = json['project_id'];

    projectLogo = List<int>.from(Validation.parseIntList(
        input: json['logo'].toString(), title: "Logo")!);
  }
  Map<String, dynamic> toJsonUpdateLogo() {
    final data = <String, dynamic>{};
    data['project_logo'] = projectLogo;

    data.removeWhere((key, value) => value == null);

    return data;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?------------------------Presentation-------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  ProjectModel.fromJsonPresentationRequestEdit(Map<String, dynamic> json) {
    projectId = json['project_id'];

    presentation = List<int>.from(Validation.parseIntList(
        input: json['presentation_file'].toString(),
        title: "Presentation file")!);
  }
  Map<String, dynamic> toJsonUpdatePresentation() {
    final data = <String, dynamic>{};
    data['presentation'] = projectLogo;

    data.removeWhere((key, value) => value == null);

    return data;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-------------------------Images----------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  ProjectModel.fromJsonImagesRequestEdit(Map<String, dynamic> json) {
    images = (json['images'] as List<dynamic>)
        .map((e) => List<int>.from(Validation.parseIntList(
            input: e.toString(), title: "One of Images")!))
        .toList();
  }
  Map<String, dynamic> toJsonUpdateImages() {
    final data = <String, dynamic>{};
    data['images'] = images?.map((e) => List<int>.from(e)).toList();

    return data;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-------------------------Link------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  ProjectModel.fromJsonLinkRequestEdit(Map<String, dynamic> json) {
    link = List.from(json['link']).map((e) => Link.fromJson(e)).toList();
  }
  List toJsonUpdateLink() {
    List data = [];
    link?.map((e) {
      data.add({
        "project_id": projectId,
        "type": e.type,
        "url": e.url,
      });
    }).toList();
    return data;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  ProjectModel.fromJsonMembersRequestEdit(Map<String, dynamic> json) {
    members =
        List.from(json['members']).map((e) => Members.fromJson(e)).toList();
  }
  List<Map<String, dynamic>> toJsonUpdateMembers() {
    List<Map<String, dynamic>> data = [];
    data =
        members!.map((e) => {"project_id": projectId, ...e.toJson()}).toList();

    return data;
  }
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
  //?-----------------------------------------------------
}

class Link {
  Link({
    this.projectId,
    this.type,
    this.url,
  });
  String? projectId;
  String? type;
  String? url;

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['type'] = type;
    data['url'] = url;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}

class Members {
  Members({
    required this.idMembers,
    required this.position,
  });
  String? id;
  late final String idMembers;
  late final String position;

  Members.fromJson(Map<String, dynamic> json) {
    idMembers = json['user_id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = idMembers;
    data['position'] = position;

    return data;
  }
}

//-----

enum ProjectType {
  app,
  website,
  vr,
  ar,
  ai,
  ml,
  uiux, // Note: Replaced "ui/ux" with "uiUx" as enum values cannot contain special characters
  gaming,
  unity,
  cyber,
  software,
  automation,
  robotic,
  api,
  analytics,
  iot,
  cloud
}

String? getProjectTypeName({String? type}) {
  if (type == null) {
    return null;
  }
  switch (type) {
    case "app":
      return 'app';
    case "website":
      return 'website';
    case "vr":
      return 'vr';
    case "ar":
      return 'ar';
    case "ai":
      return 'ai';
    case "ml":
      return 'ml';
    case "ui/ux":
      return 'ui/ux';
    case "unity":
      return 'unity';
    case "software":
      return 'software';
    case "automation":
      return 'automation';
    case "robotic":
      return 'robotic';
    case "api":
      return 'api';
    case "analytics":
      return 'analytics';
    case "iot":
      return 'iot';
    case "cloud":
      return 'cloud';
    case "other":
      return 'other';

    default:
      throw FormatException("You should select a type from the following: "
          "(app, website, vr, ar, ai, ml, ui/ux, gaming, unity, cyber, software, automation, robotic, api, analytics, iot, cloud)");
  }
}
