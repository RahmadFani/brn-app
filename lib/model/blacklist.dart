class BlacklistModel {
  int id;
  String caseReportId;
  String nik;
  String name;
  String phoneNumber;
  String address;
  String profilePhotoPath;
  String information;
  String createdAt;
  String updatedAt;
  String profilePhotoUrl;

  BlacklistModel(
      {this.id,
      this.caseReportId,
      this.nik,
      this.name,
      this.phoneNumber,
      this.address,
      this.profilePhotoPath,
      this.information,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  BlacklistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseReportId = json['case_report_id'];
    nik = json['nik'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    profilePhotoPath = json['profile_photo_path'];
    information = json['information'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['case_report_id'] = this.caseReportId;
    data['nik'] = this.nik;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['information'] = this.information;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
