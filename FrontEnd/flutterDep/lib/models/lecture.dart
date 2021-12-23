class Lecture {
  String subject;
  String abbreviation;
  String classroom;
  String teacherName;
  DateTime begin;
  DateTime end;
  String qrcode;
  bool presence_checked = false;
  Lecture(this.subject, this.abbreviation, this.classroom, this.teacherName,
      this.begin, this.end, this.qrcode);
}
