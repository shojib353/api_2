/// id : 101
/// title : "foo"
/// body : "bar"
/// userId : 1

class PostResponse {
  PostResponse({
      num? id, 
      String? title, 
      String? body, 
      String? userId,}){
    _id = id;
    _title = title;
    _body = body;
    _userId = userId;
}

  PostResponse.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
    _userId = json['userId'];
  }
  num? _id;
  String? _title;
  String? _body;
  String? _userId;
PostResponse copyWith({  num? id,
  String? title,
  String? body,
  String? userId,
}) => PostResponse(  id: id ?? _id,
  title: title ?? _title,
  body: body ?? _body,
  userId: userId ?? _userId,
);
  num? get id => _id;
  String? get title => _title;
  String? get body => _body;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    map['userId'] = _userId;
    return map;
  }

}