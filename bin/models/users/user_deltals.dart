import 'project_deltels.dart';

class UserDetails {
  UserDetails({
    required this.id,
    required this.authId,
    required this.fName,
    required this.lName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.allowEdit,
    required this.role,
    required this.userAccount,
    required this.projects,
  });
  late final String id;
  String? imageURL;
  String? resumeURL;
  late final String authId;
  late final String fName;
  late final String lName;
  late final String email;
  late final String createdAt;
  late final String updatedAt;
  late final String allowEdit;
  late final String role;
  late final UserAccount userAccount;
  late final List<ProjectsDetails> projects;

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageURL = json['image'];
    resumeURL = json['resume'];
    authId = json['auth_id'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    allowEdit = json['allow_edit'];
    role = json['role'];
    userAccount = UserAccount.fromJson(json['user_account'] ?? {});
    projects = List.from(json['projects'])
        .map((e) => ProjectsDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = fName;
    data['last_name'] = lName;
    data['email'] = email;
    data['role'] = role;
    data['image_url'] = imageURL;
    data['resume_url'] = resumeURL;
    data['link'] = userAccount.toJson();
    data['projects'] = projects.map((e) => e.toJson()).toList();
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
