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
}
