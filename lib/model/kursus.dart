class KursusModel {
  int id;
  String level;
  bool isDiklat;
  int userId;
  String image;
  String imageUrl;
  String name;
  String description;
  int lessonsCount;
  int likesCount;
  int commentsCount;
  String createdAt;
  String updatedAt;

  KursusModel(
      {this.id,
      this.level,
      this.isDiklat,
      this.userId,
      this.image,
      this.imageUrl,
      this.name,
      this.description,
      this.lessonsCount,
      this.likesCount,
      this.commentsCount,
      this.createdAt,
      this.updatedAt});

  KursusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    isDiklat = json['is_diklat'];
    userId = json['user_id'];
    image = json['image'];
    imageUrl = json['image_url'];
    name = json['name'];
    description = json['description'];
    lessonsCount = json['lessons_count'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['is_diklat'] = this.isDiklat;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['lessons_count'] = this.lessonsCount;
    data['likes_count'] = this.likesCount;
    data['comments_count'] = this.commentsCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
