class KategoriArtikelModel {
  int id;
  String slug;
  String name;
  Null description;

  KategoriArtikelModel({this.id, this.slug, this.name, this.description});

  KategoriArtikelModel.fromJson(Map<String, dynamic> json) {
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
