class OnboardModel {
  int id;
  String image;
  String imageUrl;
  String title;
  String description;
  bool active;
  int order;

  OnboardModel(
      {this.id,
      this.image,
      this.imageUrl,
      this.title,
      this.description,
      this.active,
      this.order});

  OnboardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    imageUrl = json['image_url'];
    title = json['title'];
    description = json['description'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['description'] = this.description;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}
