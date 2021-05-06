import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.message,
        this.code,
        this.type,
        this.token,
    });

    String message;
    int code;
    String type;
    String token;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        code: json["code"],
        type: json["type"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "type": type,
        "token": token,
    };
}
