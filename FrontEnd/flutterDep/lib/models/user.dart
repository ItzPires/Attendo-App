class User {
  String name;
  String mail;
  String aboutMe;
  int number;
  String authToken;
  bool isTeacher;

  User(this.name, this.mail, this.number, this.aboutMe, this.authToken,
      this.isTeacher);

  @override
  String toString() {
    return name + " " + mail;
  }

  set setAboutMe(String aboutMe) => this.aboutMe = aboutMe;
  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        mail = json["mail"],
        number = json["number"],
        aboutMe = json["aboutMe"],
        authToken = json["authToken"],
        isTeacher = json["isTeacher"];
}
