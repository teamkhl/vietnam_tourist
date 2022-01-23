class Comment {
  int? id;
  int? postId;
  int? usserId;
  String? content;
  String? createdAt;

  Comment({
    this.id,
    this.postId,
    this.usserId,
    this.content,
    this.createdAt,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.postId = json["postId"];
    this.usserId = json["usserId"];
    this.content = json["content"];
    this.createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["postId"] = this.postId;
    data["usserId"] = this.usserId;
    data["content"] = this.content;
    data["created_at"] = this.createdAt;
    return data;
  }
}
