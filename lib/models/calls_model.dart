// To parse this JSON data, do
//
//     final CallModel = CallsMidelFrmoson(jsonString);

import 'dart:convert';

List<CallModel> CallModelFromJson(String str) => List<CallModel>.from(json.decode(str).map((x) => CallModel.fromJson(x)));

String CallModelToJson(List<CallModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CallModel {
    CallModel({
        this.to,
        this.from,
        this.type,
        this.missed,
        this.duration,
        this.createdAt,
    });

    String? to;
    String? from;
    String? type;
    bool? missed;
    int? duration;
    String? createdAt;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        to: json["to"],
        from: json["from"],
        type: json["type"],
        missed: json["missed"],
        duration: json["duration"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "to": to,
        "from": from,
        "type": type,
        "missed": missed,
        "duration": duration,
        "created_at": createdAt,
    };
}
