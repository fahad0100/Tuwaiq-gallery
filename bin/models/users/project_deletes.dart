class ProjectsDetails {
  ProjectsDetails({
    this.projectId,
    this.projectName,
    this.bootcampName,
    this.startDate,
    this.endDate,
    this.presentationDate,
    this.projectDescription,
    this.logoUrl,
    this.presentationUrl,
    this.userId,
    this.adminId,
    this.timeEndEdit,
    this.allowEdit,
    this.isPublic,
    this.createAt,
    this.updateAt,
    this.imagesProject,
    this.linksProject,
    this.membersProject,
  });
  String? projectId;
  String? type;
  String? projectName;
  String? bootcampName;
  String? startDate;
  String? endDate;
  String? presentationDate;
  String? projectDescription;
  String? logoUrl;
  String? presentationUrl;
  String? userId;
  String? adminId;
  String? timeEndEdit;
  bool? allowEdit;
  bool? isPublic;
  bool? allowRating;
  String? createAt;
  String? updateAt;
  List<ImagesProject>? imagesProject;
  List<LinksProject>? linksProject;
  List<MembersProject>? membersProject;

//-----------------------------------------------------
  ProjectsDetails.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    type = json['type'];
    projectName = json['project_name'];
    bootcampName = json['bootcamp_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    presentationDate = json['presentation_date'];
    projectDescription = json['project_description'];
    logoUrl = json['logo_url'];
    presentationUrl = json['presentation_url'];
    userId = json['user_id'];
    adminId = json['admin_id'];
    timeEndEdit = json['time_end_edit'];
    allowEdit = json['allow_edit'];
    allowRating = json['allow_rating'];
    isPublic = json['is_public'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    imagesProject = List.from(json['images_project'] ?? [])
        .map((e) => ImagesProject.fromJson(e))
        .toList();
    linksProject = List.from(json['links_project'] ?? [])
        .map((e) => LinksProject.fromJson(e))
        .toList();
    membersProject = List.from(json['members_project'] ?? [])
        .map((e) => MembersProject.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['type'] = type;
    data['project_name'] = projectName;
    data['bootcamp_name'] = bootcampName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['presentation_date'] = presentationDate;
    data['project_description'] = projectDescription;
    data['logo_url'] = logoUrl;
    data['presentation_url'] = presentationUrl;
    data['user_id'] = userId;
    data['admin_id'] = adminId;
    data['time_end_edit'] = timeEndEdit;
    data['allow_edit'] = allowEdit;
    data['allow_rating'] = allowRating;
    data['is_public'] = isPublic;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['images_project'] = imagesProject?.map((e) => e.toJson()).toList();
    data['links_project'] = linksProject?.map((e) => e.toJson()).toList();
    data['members_project'] = membersProject?.map((e) => e.toJson()).toList();
    return data;
  }
}

class ImagesProject {
  ImagesProject({
    this.id,
    this.url,
    this.projectId,
  });
  int? id;
  String? url;
  String? projectId;

  ImagesProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    projectId = json['project_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

class LinksProject {
  LinksProject({
    this.url,
    this.type,
    this.projectId,
  });
  String? url;
  String? type;
  String? projectId;

  LinksProject.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}

class MembersProject {
  MembersProject({
    this.id,
    this.fName,
    this.email,
    this.lName,
    this.userAccount,
    this.position,
  });
  String? id;
  String? fName;
  String? email;
  String? lName;
  String? image;
  String? resume;
  UserAccount? userAccount;
  String? position;

  MembersProject.fromJson(Map<String, dynamic> json) {
    id = json["users"]['id'];
    fName = json["users"]['f_name'];
    image = json["users"]['image'];
    resume = json["users"]['resume'];
    email = json["users"]['email'];
    lName = json["users"]['l_name'];
    userAccount = UserAccount.fromJson(json["users"]['user_account'] ?? {});
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = fName;
    data['last_name'] = lName;
    data['email'] = email;
    data['position'] = position;
    data['image_url'] = image;
    data['resume_url'] = resume;
    data['link'] = userAccount;
    return data;
  }
}

class UserAccount {
  UserAccount({
    this.github,
    this.resume,
    this.bindlink,
    this.linkedin,
  });
  String? github;
  String? resume;
  String? bindlink;
  String? linkedin;

  UserAccount.fromJson(Map<String, dynamic> json) {
    github = json['github'];
    resume = json['resume'];
    bindlink = json['bindlink'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['github'] = github;
    data['linkedin'] = linkedin;
    data['resume'] = resume;
    data['bindlink'] = bindlink;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
