import '../../helper/validations/validations.dart';

class RoleModel {
  RoleModel({
    this.idUser,
    this.role = RoleEnum.user,
  });
  String? idUser;
  RoleEnum? role;

  RoleModel.fromJsonChangeRoleUser(Map<String, dynamic> json) {
    idUser = Validation.validateUuid(value: json['id_user'], title: "ID user");

    switch (json['role']) {
      case 'user':
        role = RoleEnum.user;
        break;
      case 'supervisor':
        role = RoleEnum.supervisor;
        break;
      case 'admin':
        role = RoleEnum.admin;
        break;
      default:
        throw FormatException(
            "The role should be one of (user,supervisor,admin)");
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['role'] = role!.name;
    return data;
  }
}

enum RoleEnum { user, supervisor, admin }
