class ProfileModel {
  Data data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  bool active;
  int statusLevelDiklat;
  int isSurvey;
  int sumPoints;
  String name;
  String email;
  Null emailVerifiedAt;
  Null profilePhotoPath;
  String profilePhotoUrl;
  String createdAt;
  String updatedAt;
  Null reasonForInactivity;
  int paymentStatus;
  List<Addresses> addresses;
  PersonalInformation personalInformation;

  Data(
      {this.id,
      this.active,
      this.statusLevelDiklat,
      this.isSurvey,
      this.sumPoints,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.profilePhotoPath,
      this.profilePhotoUrl,
      this.createdAt,
      this.updatedAt,
      this.reasonForInactivity,
      this.paymentStatus,
      this.addresses,
      this.personalInformation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    statusLevelDiklat = json['status_level_diklat'];
    isSurvey = json['is_survey'];
    sumPoints = json['sum_points'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profilePhotoPath = json['profile_photo_path'];
    profilePhotoUrl = json['profile_photo_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reasonForInactivity = json['reason_for_inactivity'];
    paymentStatus = json['payment_status'];
    if (json['addresses'] != null) {
      addresses = new List<Addresses>();
      json['addresses'].forEach((v) {
        addresses.add(new Addresses.fromJson(v));
      });
    }
    personalInformation = json['personal_information'] != null
        ? new PersonalInformation.fromJson(json['personal_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['status_level_diklat'] = this.statusLevelDiklat;
    data['is_survey'] = this.isSurvey;
    data['sum_points'] = this.sumPoints;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reason_for_inactivity'] = this.reasonForInactivity;
    data['payment_status'] = this.paymentStatus;
    if (this.addresses != null) {
      data['addresses'] = this.addresses.map((v) => v.toJson()).toList();
    }
    if (this.personalInformation != null) {
      data['personal_information'] = this.personalInformation.toJson();
    }
    return data;
  }
}

class Addresses {
  int id;
  String label;
  String givenName;
  String familyName;
  String organization;
  String countryCode;
  String street;
  String state;
  String city;
  String postalCode;
  double latitude;
  double longitude;
  bool isPrimary;
  bool isBilling;
  bool isShipping;

  Addresses(
      {this.id,
      this.label,
      this.givenName,
      this.familyName,
      this.organization,
      this.countryCode,
      this.street,
      this.state,
      this.city,
      this.postalCode,
      this.latitude,
      this.longitude,
      this.isPrimary,
      this.isBilling,
      this.isShipping});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    givenName = json['given_name'];
    familyName = json['family_name'];
    organization = json['organization'];
    countryCode = json['country_code'];
    street = json['street'];
    state = json['state'];
    city = json['city'];
    postalCode = json['postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isPrimary = json['is_primary'];
    isBilling = json['is_billing'];
    isShipping = json['is_shipping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['given_name'] = this.givenName;
    data['family_name'] = this.familyName;
    data['organization'] = this.organization;
    data['country_code'] = this.countryCode;
    data['street'] = this.street;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postal_code'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_primary'] = this.isPrimary;
    data['is_billing'] = this.isBilling;
    data['is_shipping'] = this.isShipping;
    return data;
  }
}

class PersonalInformation {
  Null idCard;
  String nikKtp;
  String bio;
  Null phoneNumber;
  String gender;
  String placeOfBirth;
  String dateOfBirth;
  String companyName;
  Null companyLogo;
  String companyLogoUrl;
  String siupskuNumber;
  Null siupskuImage;
  String siupskuImageUrl;
  String clothesSize;
  int numberOfUnits;
  String areaDialingCode;
  Null area;
  Null areaCode;
  Null region;

  PersonalInformation(
      {this.idCard,
      this.nikKtp,
      this.bio,
      this.phoneNumber,
      this.gender,
      this.placeOfBirth,
      this.dateOfBirth,
      this.companyName,
      this.companyLogo,
      this.companyLogoUrl,
      this.siupskuNumber,
      this.siupskuImage,
      this.siupskuImageUrl,
      this.clothesSize,
      this.numberOfUnits,
      this.areaDialingCode,
      this.area,
      this.areaCode,
      this.region});

  PersonalInformation.fromJson(Map<String, dynamic> json) {
    idCard = json['id_card'];
    nikKtp = json['nik_ktp'];
    bio = json['bio'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    placeOfBirth = json['place_of_birth'];
    dateOfBirth = json['date_of_birth'];
    companyName = json['company_name'];
    companyLogo = json['company_logo'];
    companyLogoUrl = json['company_logo_url'];
    siupskuNumber = json['siupsku_number'];
    siupskuImage = json['siupsku_image'];
    siupskuImageUrl = json['siupsku_image_url'];
    clothesSize = json['clothes_size'];
    numberOfUnits = json['number_of_units'];
    areaDialingCode = json['area_dialing_code'];
    area = json['area'];
    areaCode = json['area_code'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_card'] = this.idCard;
    data['nik_ktp'] = this.nikKtp;
    data['bio'] = this.bio;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['place_of_birth'] = this.placeOfBirth;
    data['date_of_birth'] = this.dateOfBirth;
    data['company_name'] = this.companyName;
    data['company_logo'] = this.companyLogo;
    data['company_logo_url'] = this.companyLogoUrl;
    data['siupsku_number'] = this.siupskuNumber;
    data['siupsku_image'] = this.siupskuImage;
    data['siupsku_image_url'] = this.siupskuImageUrl;
    data['clothes_size'] = this.clothesSize;
    data['number_of_units'] = this.numberOfUnits;
    data['area_dialing_code'] = this.areaDialingCode;
    data['area'] = this.area;
    data['area_code'] = this.areaCode;
    data['region'] = this.region;
    return data;
  }
}
