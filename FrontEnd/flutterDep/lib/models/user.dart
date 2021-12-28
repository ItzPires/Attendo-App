class User {
  String name;
  String mail;
  String aboutMe;
  int number;
  int id;
  String authToken;
  bool isTeacher;

  User(this.name, this.mail, this.number, this.aboutMe, this.authToken,
      this.isTeacher, this.id);

  @override
  String toString() {
    return name + " " + mail;
  }

  static Map<String, dynamic> toMap(User users) => {
        'name': users.name,
        'mail': users.mail,
        'aboutMe': users.aboutMe,
        'number': users.number,
        'id': users.id,
        'authToken': users.authToken,
        'isTeacher': users.isTeacher,
      };

  set setAboutMe(String aboutMe) => this.aboutMe = aboutMe;
  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        mail = json["mail"],
        number = json["number"],
        aboutMe = json["aboutMe"],
        authToken = json["authToken"],
        isTeacher = json["isTeacher"],
        id = json["id"];
}
