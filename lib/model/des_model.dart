class DescriptionModel {
  int? userid;
  int? id;
  String? title;
  String? body;

  DescriptionModel({this.userid, this.id, this.title, this.body});

  factory DescriptionModel.fromjson(Map<String, dynamic> json) {
    return DescriptionModel(
      userid: json['userid'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
  Map<String, dynamic> tojson() {
    return {'userid': userid, 'id': id, 'title': title, 'body': body};
  }
}
