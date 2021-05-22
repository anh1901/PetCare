import 'dart:convert';

import 'comment_model.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  int messageId;
  int userId;
  String messageType;
  String messageInfo;
  int noComment;
  int noLike;
  int noRead;
  int fileCount;
  String followStatus;
  String isSelf;
  String agreeStatus;
  String createTime;
  String time;
  List<FileList> fileList;
  FindUserInfo userInfo;
  MessageLabel messageLabel;
  List<dynamic> atUsers;
  List<CommentModel> commentList;
  PostModel({
    this.messageId,
    this.userId,
    this.messageType,
    this.messageInfo,
    this.noComment,
    this.noLike,
    this.noRead,
    this.fileCount,
    this.followStatus,
    this.isSelf,
    this.agreeStatus,
    this.createTime,
    this.time,
    this.fileList,
    this.userInfo,
    this.messageLabel,
    this.atUsers,
    this.commentList,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        messageId: json["messageId"],
        userId: json["userId"],
        messageType: json["messageType"],
        messageInfo: json["messageInfo"],
        noComment: json["noComment"],
        noLike: json["noLike"],
        noRead: json["noRead"],
        fileCount: json["fileCount"],
        followStatus: json["followStatus"],
        isSelf: json["isSelf"],
        agreeStatus: json["agreeStatus"],
        createTime: json["createTime"],
        time: json["time"],
        fileList: List<FileList>.from(
            json["fileList"].map((x) => FileList.fromJson(x))),
        userInfo: FindUserInfo.fromJson(json["userInfo"]),
        messageLabel: MessageLabel.fromJson(json["messageLabel"] ?? {}),
        atUsers: List<dynamic>.from(json["atUsers"].map((x) => x)),
        commentList: List<CommentModel>.from(
            json["commentList"].map((x) => CommentModel.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "messageId": messageId,
        "userId": userId,
        "messageType": messageType,
        "messageInfo": messageInfo,
        "cntComment": noComment,
        "cntAgree": noLike,
        "cntRead": noRead,
        "fileCount": fileCount,
        "followStatus": followStatus,
        "isSelf": isSelf,
        "agreeStatus": agreeStatus,
        "createTime": createTime,
        "time": time,
        "fileList": List<dynamic>.from(fileList.map((x) => x.toJson())),
        "userInfo": userInfo.toJson(),
        "messageLabel": messageLabel.toJson(),
        "atUsers": List<dynamic>.from(atUsers.map((x) => x)),
        "commentList": List<dynamic>.from(commentList.map((x) => x.toJson())),
      };
}

class FileList {
  FileList({
    this.fileId,
    this.fileUrl,
    this.fileType,
    this.height,
    this.width,
  });

  int fileId;
  String fileUrl;
  String fileType;
  String height;
  String width;

  factory FileList.fromJson(Map<String, dynamic> json) => FileList(
        fileId: json["fileId"],
        fileUrl: json["fileUrl"],
        fileType: json["fileType"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "fileUrl": fileUrl,
        "fileType": fileType,
        "height": height,
        "width": width,
      };
}

class MessageLabel {
  MessageLabel({
    this.labelId,
    this.labelName,
  });

  int labelId;
  String labelName;

  factory MessageLabel.fromJson(Map<String, dynamic> json) => MessageLabel(
        labelId: json["labelId"] ?? 0,
        labelName: json["labelName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "labelId": labelId,
        "labelName": labelName,
      };
}

class FindUserInfo {
  int userId;
  String avatarImg;
  String nickname;
  String city;
  FindUserInfo({this.userId, this.avatarImg, this.nickname, this.city});
  factory FindUserInfo.fromJson(Map<String, dynamic> json) => FindUserInfo(
        userId: json["userId"],
        avatarImg: json["avatarImg"],
        nickname: json["nickname"],
        city: json["city"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "avatarImg": avatarImg,
        "nickname": nickname,
        'city': city
      };
}
