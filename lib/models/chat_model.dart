import 'dart:convert';

List<ChatModel> ChatModelFromJson(String str) => List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
    ChatModel({
        this.name,
        this.lastMessageAt,
        this.lastMessageText,
        this.profilePictureUrl,
    });

    String? name;
    String? lastMessageAt;
    String? lastMessageText;
    String? profilePictureUrl;


    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        name: json["name"] == null ? null : json["name"],
        lastMessageAt: json["last_message_at"] == null ? null : json["last_message_at"],
        lastMessageText: json["last_message_text"] == null ? null : json["last_message_text"],
      profilePictureUrl: json["profile_picture_url"] == null ? null : json["profile_picture_url"],
   
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "last_message_at": lastMessageAt == null ? null : lastMessageAt,
        "last_message_text": lastMessageText == null ? null : lastMessageText,
        "profile_picture_url": profilePictureUrl == null ? null : profilePictureUrl,
    
    };
}
