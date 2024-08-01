import '../helper/validations/validations.dart';

class AuthModel {
  AuthModel({
    this.email,
    this.phone,
    this.fName,
    this.lName,
  });
  String? email;
  String? phone;
  String? fName;
  String? lName;
  String? otp;

  AuthModel.fromJsonCreate(Map<String, dynamic> json) {
    email = Validation.isValidEmail(
        email: Validation.isValidNotNull(
            value: json['email'].toString(), title: "Email"));
    fName = Validation.isValidOneWordName(
        value: json['f_name'].toString(), title: "First name");
    lName = Validation.isValidOneWordName(
        value: json['l_name'].toString(), title: "Last name");
  }

  Map<String, dynamic> toJsonCreate() {
    final dart = <String, dynamic>{};
    dart['email'] = email;
    dart['f_name'] = fName;
    dart['l_name'] = lName;
    return dart;
  }

  //----------------------------------------Login ---------------------------------
  AuthModel.fromJsonLogin(Map<String, dynamic> json) {
    email = Validation.isValidEmail(
        email: Validation.isValidNotNull(
            value: json['email'].toString(), title: "Email"));
  }

  Map<String, dynamic> toJsonLogin() {
    final dart = <String, dynamic>{};
    dart['email'] = email;
    return dart;
  }

  //----------------------------------------Verify ---------------------------------
  AuthModel.fromJsonVerify(Map<String, dynamic> json) {
    email = Validation.isValidEmail(
        email: Validation.isValidNotNull(
            value: json['email'].toString(), title: "Email"));
    otp = Validation.isValidOTP(
        otp: Validation.isValidNotNull(
            value: json['otp'].toString(), title: "OTP"));
  }

  Map<String, dynamic> toJsonVerify() {
    final dart = <String, dynamic>{};
    dart['email'] = email;
    dart['otp'] = otp;
    return dart;
  }
  //----------------------------------------login ---------------------------------
}
