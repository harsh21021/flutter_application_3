class AppUser {
  String? id, name,phone, email, password;
  bool? approve;

  AppUser(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.password,
});

  factory AppUser.fromJson(Map<String, dynamic> data) {
    return AppUser(
        id: data['uid'].toString(),
        name: data['name'].toString(),
        phone: data['mobileNo'].toString(),
        email: data['email'].toString(),
        password: data['password'].toString(),
        );
  }
}


// test 1