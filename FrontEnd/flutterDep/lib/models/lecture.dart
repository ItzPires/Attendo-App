import 'dart:convert';

class Lecture {
  String subject;
  String abbreviation;
  String classroom;
  String teacherName;
  String department;
  DateTime begin;
  DateTime end;
  String qrcode;
  bool presenceChecked = false;
  Lecture(this.subject, this.abbreviation, this.classroom, this.teacherName,
      this.department, this.begin, this.end, this.qrcode);

  static Map<String, dynamic> toMap(Lecture lecture) => {
        'subject': lecture.subject,
        'abbreviation': lecture.abbreviation,
        'classroom': lecture.classroom,
        'teacherName': lecture.teacherName,
        'department': lecture.department,
        'begin': lecture.begin.toString(),
        'end': lecture.end.toString(),
        'qrcode': lecture.qrcode,
        'presenceChecked': lecture.presenceChecked
      };

  Lecture.fromJson(Map<String, dynamic> json)
      : subject = json["subject"],
        abbreviation = json["abbreviation"],
        classroom = json["classroom"],
        teacherName = json["teacherName"],
        department = json["department"],
        begin = DateTime.parse(json["begin"]),
        end = DateTime.parse(json["end"]),
        qrcode = json["qrcode"],
        presenceChecked = json["presenceChecked"];

  static String encode(List<Lecture> lectures) => json.encode(
        lectures
            .map<Map<String, dynamic>>((lectures) => Lecture.toMap(lectures))
            .toList(),
      );

  static List<Lecture> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Lecture>((item) => Lecture.fromJson(item))
          .toList();
}
