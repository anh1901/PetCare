import 'dart:convert';

LoginInfo loginInfoFromJson(String str) => LoginInfo.fromJson(json.decode(str));

String loginInfoToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
  int lastUserId = 0;

  int id;
  int userDataId;
  String username;
  String encryptedPassword;
  String accToken;
  String avatarUrl;
  String nickname;
  String sex;
  String intro;
  String city;
  LoginInfo({
    this.id,
    this.userDataId,
    this.username,
    this.accToken,
    this.encryptedPassword,
    this.avatarUrl,
    this.nickname,
    this.sex,
    this.intro,
    this.city,
  });

  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      id: json["id"],
      userDataId: json["userDataId"],
      username: json["username"],
      accToken: json["accToken"],
      encryptedPassword: json["encryptedPassword"],
      avatarUrl: json["avatarUrl"] ?? '',
      nickname: json["nickname"] ?? '',
      sex: json["sex"] ?? '',
      intro: json["intro"] ?? '',
      city: json["city"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userDataId": userDataId,
        "username": username,
        "accToken": accToken,
        "encryptedPassword": encryptedPassword,
        "avatarUrl": avatarUrl,
        "nickname": nickname,
        "city": city,
      };
}
