class MemberModel {
  int id;
  int active;
  int pointsRelationSumPoints;
  String name;
  String email;
  String profilePhotoPath;
  String profilePhotoUrl;
  String createdAt;
  String reasonForInactivity;

  MemberModel(
      {this.id,
      this.active,
      this.pointsRelationSumPoints,
      this.name,
      this.email,
      this.profilePhotoPath,
      this.profilePhotoUrl,
      this.createdAt,
      this.reasonForInactivity});

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    pointsRelationSumPoints = json['points_relation_sum_points'];
    name = json['name'];
    email = json['email'];
    profilePhotoPath = json['profile_photo_path'];
    profilePhotoUrl = json['profile_photo_url'];
    createdAt = json['created_at'];
    reasonForInactivity = json['reason_for_inactivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['points_relation_sum_points'] = this.pointsRelationSumPoints;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['created_at'] = this.createdAt;
    data['reason_for_inactivity'] = this.reasonForInactivity;
    return data;
  }
}
