import 'dart:convert';

List<ChatModel> ChatModelFromJson(String str) => List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
    ChatModel({
        this.id,
        this.name,
        this.profilePictureUrl,
        this.online=false,
        this.chats,
    });

    String? id;
    String? name;
    String? profilePictureUrl;
    bool online;
    List<Chat>? chats;


    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        profilePictureUrl: json["profile_picture_url"] == null ? null : json["profile_picture_url"],
        online: json["online"] == null ? null : json["online"],
        chats: json["chats"] == null ? null : List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
    
    );

    Map<String, dynamic> toJson() => {
           "id": id,
        "name": name == null ? null : name,
        "profile_picture_url": profilePictureUrl == null ? null : profilePictureUrl,
        "online": online == null ? null : online,
        "chats": chats == null ? null : List<dynamic>.from(chats!.map((x) => x.toJson())),
    
    };
}


class Chat {
    Chat({
        this.messageText,
        this.createdAt,
        this.sentBy,
    });

    String? messageText;
    String? createdAt;
    String? sentBy;

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        messageText: json["message_text"] == null ? null : json["message_text"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        sentBy: json["sent_by"] == null ? null : json["sent_by"],
    );

    Map<String, dynamic> toJson() => {
        "message_text": messageText == null ? null : messageText,
        "created_at": createdAt == null ? null : createdAt,
        "sent_by": sentBy == null ? null : sentBy,
    };
}
