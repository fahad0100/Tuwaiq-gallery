import '../../helper/validations/validations.dart';
import 'project_deltels.dart';

class UpdateProfileModel {
  UpdateProfileModel({
    this.fName,
    this.lName,
    this.accounts,
  });
  String? fName;

  List<int>? imageDataBinary;
  List<int>? resumeDataBinary;

  String? imageURL;
  String? resumeURL;
  String? lName;
  UserAccount? accounts;

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      throw FormatException("Should update one of data");
    }
    fName = Validation.isValidOneWordName(
        value: json['first_name'].toString(), title: "First name");
    lName = Validation.isValidOneWordName(
        value: json['last_name'].toString(), title: "Last name");
    imageDataBinary = Validation.parseIntList(
        input: json['image'].toString(), title: "image", isOption: true);
    resumeDataBinary = Validation.parseIntList(
        input: json['cv'].toString(), title: "image", isOption: true);

    accounts = json['accounts'] != null
        ? UserAccount.fromJson(json['accounts'])
        : null;
  }

  Map<String, dynamic> toJsonBasicUpdate() {
    final data = <String, dynamic>{};
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['image'] = imageURL;
    data['resume'] = resumeURL;

    data.removeWhere((key, value) => value == null);
    return data;
  }

  Map<String, dynamic> toJsonAccountUpdate() {
    final data = <String, dynamic>{};

    data['accounts'] = accounts?.toJson();
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
