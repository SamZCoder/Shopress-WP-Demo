class User {
  User({
    this.id = 0,
    this.email = "",
    this.niceName = "",
    this.firstName = "",
    this.lastName = "",
    this.displayName = "",
    this.password = "",
  });

  int id = 0;
  String email = "";
  String niceName = "";
  String firstName = "";
  String lastName = "";
  String displayName = "";
  String password = "";

  factory User.fromJson(dynamic json) {
    return User(
      displayName: (json["displayName"] ?? "") as String,
      firstName: (json["firstName"] ?? "") as String,
      lastName: (json["lastName"] ?? "") as String,
      email: (json["email"] ?? "") as String,
      niceName: (json["nicename"] ?? "") as String,
      id: (json["id"] ?? 0) as int,
    );
  }

  factory User.fromCustomerJson(dynamic json) {
    return User(
      displayName: (json["username"] ?? "") as String,
      firstName: (json["first_name"] ?? "") as String,
      lastName: (json["last_name"] ?? "") as String,
      email: (json["email"] ?? "") as String,
      niceName: "",
      id: (json["id"] ?? 0) as int,
    );
  }
}
