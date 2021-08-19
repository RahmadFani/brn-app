class ArtikelModel {
  int id;
  String slug;
  String image;
  String imageUrl;
  String title;
  String content;
  String status;
  String date;
  bool featured;
  String createdAt;
  String updatedAt;
  int likesCount;
  int viewsCount;
  int commentsCount;
  Author author;
  List<Categories> categories;

  ArtikelModel(
      {this.id,
      this.slug,
      this.image,
      this.imageUrl,
      this.title,
      this.content,
      this.status,
      this.date,
      this.featured,
      this.createdAt,
      this.updatedAt,
      this.likesCount,
      this.viewsCount,
      this.commentsCount,
      this.author,
      this.categories});

  ArtikelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    image = json['image'];
    imageUrl = json['image_url'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    date = json['date'];
    featured = json['featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    likesCount = json['likes_count'];
    viewsCount = json['views_count'];
    commentsCount = json['comments_count'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['content'] = this.content;
    data['status'] = this.status;
    data['date'] = this.date;
    data['featured'] = this.featured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['likes_count'] = this.likesCount;
    data['views_count'] = this.viewsCount;
    data['comments_count'] = this.commentsCount;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  int id;
  List<Roles> roles;
  String name;
  String email;
  Null profilePhotoPath;
  String profilePhotoUrl;
  String createdAt;

  Author(
      {this.id,
      this.roles,
      this.name,
      this.email,
      this.profilePhotoPath,
      this.profilePhotoUrl,
      this.createdAt});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
    name = json['name'];
    email = json['email'];
    profilePhotoPath = json['profile_photo_path'];
    profilePhotoUrl = json['profile_photo_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Roles {
  String name;

  Roles({this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Categories {
  int id;
  String slug;
  String name;
  Null description;

  Categories({this.id, this.slug, this.name, this.description});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
