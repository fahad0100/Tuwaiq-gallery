class TokenModel {
  TokenModel({
    required this.sub,
    required this.exp,
    required this.iat,
    required this.email,
    required this.phone,
    required this.sessionId,
    required this.isAnonymous,
  });
  late final String sub;
  late final int exp;
  late final int iat;
  late final String email;
  late final String phone;
  late final String idDataBase;
  late final String roleUser;
  late final String sessionId;
  late final bool isAnonymous;

  TokenModel.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    exp = json['exp'];
    iat = json['iat'];
    email = json['email'];
    phone = json['phone'];
    idDataBase = json['user_metadata']['public_user_id'];
    roleUser = json['user_metadata']['role'];
    sessionId = json['session_id'];
    isAnonymous = json['is_anonymous'];
  }
}
