import 'dart:convert';

import 'user_info_model.dart';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.user,
    this.userinfo,
    this.usermedalList,
    this.petCount,
    this.messageCount,
    this.fansCount,
    this.followCount,
    this.agreeCount,
    this.isSelf,
    this.followStatus,
    this.totalWalkDogTime,
    this.fansNotifyStatus,
    this.deviceStatus,
    this.tribeFirstStatus,
    this.validCouponCount,
  });

  User user;
  UserInfo userinfo;
  List<dynamic> usermedalList;
  int petCount;
  int messageCount;
  int fansCount;
  int followCount;
  int agreeCount;
  String isSelf;
  String followStatus;
  String totalWalkDogTime;
  String fansNotifyStatus;
  bool deviceStatus;
  bool tribeFirstStatus;
  int validCouponCount;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: User.fromJson(json["user"] ?? {}),
        userinfo: UserInfo.fromJson(json["userinfo"]),
        usermedalList:
            List<dynamic>.from(json["usermedalList"].map((x) => x)) ?? [],
        petCount: json["petCount"],
        messageCount: json["messageCount"],
        fansCount: json["fansCount"],
        followCount: json["followCount"],
        agreeCount: json["agreeCount"],
        isSelf: json["isSelf"],
        followStatus: json["followStatus"],
        totalWalkDogTime: json["totalWalkDogTime"],
        fansNotifyStatus: json["fansNotifyStatus"],
        deviceStatus: json["deviceStatus"],
        tribeFirstStatus: json["tribeFirstStatus"],
        validCouponCount: json["validCouponCount"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "userinfo": userinfo?.toJson(),
        "usermedalList": List<dynamic>.from(usermedalList?.map((x) => x)),
        "petCount": petCount,
        "messageCount": messageCount,
        "fansCount": fansCount,
        "followCount": followCount,
        "agreeCount": agreeCount,
        "isSelf": isSelf,
        "followStatus": followStatus,
        "totalWalkDogTime": totalWalkDogTime,
        "fansNotifyStatus": fansNotifyStatus,
        "deviceStatus": deviceStatus,
        "tribeFirstStatus": tribeFirstStatus,
        "validCouponCount": validCouponCount,
      };
}

class User {
  User({
    this.userId,
    this.userPhone,
    this.userPassword,
    this.userType,
    this.authStatus,
    this.userProperty,
    this.registerChannel,
    this.registerType,
    this.platformType,
    this.createTime,
    this.modifyTime,
    this.isFlag,
    this.delFlag,
  });

  int userId;
  String userPhone;
  String userPassword;
  String userType;
  String authStatus;
  String userProperty;
  String registerChannel;
  String registerType;
  String platformType;
  String createTime;
  String modifyTime;
  String isFlag;
  String delFlag;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        userPhone: json["userPhone"],
        userPassword: json["userPassword"],
        userType: json["userType"],
        authStatus: json["authStatus"],
        userProperty: json["userProperty"],
        registerChannel: json["registerChannel"],
        registerType: json["registerType"],
        platformType: json["platformType"],
        createTime: json["createTime"],
        modifyTime: json["modifyTime"],
        isFlag: json["isFlag"],
        delFlag: json["delFlag"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userPhone": userPhone,
        "userPassword": userPassword,
        "userType": userType,
        "authStatus": authStatus,
        "userProperty": userProperty,
        "registerChannel": registerChannel,
        "registerType": registerType,
        "platformType": platformType,
        "createTime": createTime,
        "modifyTime": modifyTime,
        "isFlag": isFlag,
        "delFlag": delFlag,
      };
}
