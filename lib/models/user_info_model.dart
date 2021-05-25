import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
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
  DateTime createTime;
  DateTime modifyTime;
  UserInfo({
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
    this.createTime,
    this.modifyTime,
  });
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
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
      createTime: DateTime.parse(json["createTime"]),
      modifyTime: DateTime.parse(json["modifyTime"]),
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
        "createTime": createTime?.toIso8601String(),
        "modifyTime": modifyTime?.toIso8601String(),
      };
}
