class LoginAuth {
  String nama;
  String email;
  String token;

  LoginAuth({this.nama, this.email, this.token});

  static LoginAuth fromJson(Map<String, dynamic> json) {
    return LoginAuth(
      nama: json.containsKey('nama') ? json['nama'] : '',
      email: json.containsKey('email') ? json['email'] : '',
      token: json.containsKey('token') ? json['token'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ' nama': this.nama,
      'email': this.email,
      'token': this.token,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
