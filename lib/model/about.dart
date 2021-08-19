class AboutModel {
  int key;
  String image;

  AboutModel({this.key, this.image});

  AboutModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['image'] = this.image;
    return data;
  }
}
