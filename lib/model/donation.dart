class DonationModel {
  int id;
  String title;
  String description;
  int valueTarget;
  String image;
  String imageUrl;
  String donatedAt;
  int donationUserCount;
  String donationUserSumNominal;
  String createdAt;

  DonationModel(
      {this.id,
      this.title,
      this.description,
      this.valueTarget,
      this.image,
      this.imageUrl,
      this.donatedAt,
      this.donationUserCount,
      this.donationUserSumNominal,
      this.createdAt});

  DonationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    valueTarget = json['value_target'];
    image = json['image'];
    imageUrl = json['image_url'];
    donatedAt = json['donated_at'];
    donationUserCount = json['donation_user_count'];
    donationUserSumNominal = json['donation_user_sum_nominal'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['value_target'] = this.valueTarget;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    data['donated_at'] = this.donatedAt;
    data['donation_user_count'] = this.donationUserCount;
    data['donation_user_sum_nominal'] = this.donationUserSumNominal;
    data['created_at'] = this.createdAt;
    return data;
  }
}
