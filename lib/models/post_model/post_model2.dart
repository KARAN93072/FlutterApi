class PostModel2 {
  int? id;
  int? postId;
  int? userId;
  String? comment;

  PostModel2({this.id, this.postId, this.userId, this.comment});

  PostModel2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    userId = json['userId'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    data['comment'] = this.comment;
    return data;
  }
}
