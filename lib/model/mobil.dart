class MobilModel {
  int id;
  int userId;
  String status;
  bool isApproved;
  String policeNumber;
  int year;
  bool isAutomatic;
  int capacity;
  Null equipment;
  Null stnkImage;
  String machineNumber;
  String chassisNumber;
  String createdAt;
  String updatedAt;

  MobilModel(
      {this.id,
      this.userId,
      this.status,
      this.isApproved,
      this.policeNumber,
      this.year,
      this.isAutomatic,
      this.capacity,
      this.equipment,
      this.stnkImage,
      this.machineNumber,
      this.chassisNumber,
      this.createdAt,
      this.updatedAt});

  MobilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    isApproved = json['is_approved'];
    policeNumber = json['police_number'];
    year = json['year'];
    isAutomatic = json['is_automatic'];
    capacity = json['capacity'];
    equipment = json['equipment'];
    stnkImage = json['stnk_image'];
    machineNumber = json['machine_number'];
    chassisNumber = json['chassis_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['is_approved'] = this.isApproved;
    data['police_number'] = this.policeNumber;
    data['year'] = this.year;
    data['is_automatic'] = this.isAutomatic;
    data['capacity'] = this.capacity;
    data['equipment'] = this.equipment;
    data['stnk_image'] = this.stnkImage;
    data['machine_number'] = this.machineNumber;
    data['chassis_number'] = this.chassisNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
