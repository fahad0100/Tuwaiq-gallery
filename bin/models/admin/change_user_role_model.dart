class ChangeUserRoleModel {
  ChangeUserRoleModel({
    required this.idUser,
    required this.edit,
    required this.role,
  });
  late final String idUser;
  late final bool edit;
  late final String role;

  ChangeUserRoleModel.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    edit = json['edit'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final dart = <String, dynamic>{};
    dart['id_user'] = idUser;
    dart['edit'] = edit;
    dart['role'] = role;
    return dart;
  }
}
