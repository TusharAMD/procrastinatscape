// To parse this JSON data, do
//
//     final api = apiFromJson(jsonString);

import 'dart:convert';

List<Api> apiFromJson(String str) => List<Api>.from(json.decode(str).map((x) => Api.fromJson(x)));

String apiToJson(List<Api> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
