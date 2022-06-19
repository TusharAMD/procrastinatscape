// To parse this JSON data, do
//
//     final api = apiFromJson(jsonString);

import 'dart:convert';

Api apiFromJson(String str) => Api.fromJson(json.decode(str));

String apiToJson(Api data) => json.encode(data.toJson());

class Api {
    Api({
        required this.mentor,
        required this.ngo,
        required this.task,
    });

    String mentor;
    String ngo;
    String task;

    factory Api.fromJson(Map<String, dynamic> json) => Api(
        mentor: json["mentor"],
        ngo: json["ngo"],
        task: json["task"],
    );

    Map<String, dynamic> toJson() => {
        "mentor": mentor,
        "ngo": ngo,
        "task": task,
    };
}
