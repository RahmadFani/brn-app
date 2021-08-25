class AgendaModel {
  int id;
  int userId;
  int areaId;
  String image;
  String type;
  String title;
  String description;
  String startDate;
  String endDate;
  String startTime;
  String endTime;
  String latitude;
  String longitude;
  String address;
  String qrPath;
  String createdAt;
  String updatedAt;
  String imageUrl;
  String qrCodeUrl;

  AgendaModel(
      {this.id,
      this.userId,
      this.areaId,
      this.image,
      this.type,
      this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.latitude,
      this.longitude,
      this.address,
      this.qrPath,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.qrCodeUrl});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    areaId = json['area_id'];
    image = json['image'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    qrPath = json['qr_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    qrCodeUrl = json['qr_code_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['area_id'] = this.areaId;
    data['image'] = this.image;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['qr_path'] = this.qrPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    data['qr_code_url'] = this.qrCodeUrl;
    return data;
  }
}
