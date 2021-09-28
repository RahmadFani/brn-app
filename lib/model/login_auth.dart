class LoginAuth {
  String nama;
  String email;
  String token;
  String tokenType;

  LoginAuth({this.nama, this.email, this.token, this.tokenType = 'Bearer'});

  static LoginAuth fromJson(Map<String, dynamic> json) {
    return LoginAuth(
      nama: json.containsKey('nama') ? json['nama'] : '',
      email: json.containsKey('email') ? json['email'] : '',
      token: json.containsKey('token') ? json['token'] : '',
      tokenType: json.containsKey('token_type') ? json['token_type'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ' nama': this.nama,
      'email': this.email,
      'token': this.token,
      'token_type': this.tokenType,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
