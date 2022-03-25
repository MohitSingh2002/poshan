import 'dart:convert';

class DayAttendance {

  Map<String, Attendance> attendance = {};

  DayAttendance();

  factory DayAttendance.fromJson(Map<String, dynamic> json) {
    DayAttendance dayAttendance = DayAttendance();
    final data = json['attendance'] as Map;
    for (final att in data.keys) {
      dayAttendance.attendance[att.toString()] = Attendance.fromJson(data[att]);
    }
    return dayAttendance;
  }

  @override
  String toString() {
    return 'DayAttendance{attendance: $attendance}';
  }

}

class Attendance {

  String className;
  String name;
  int type;

  Attendance({required this.className, required this.name, required this.type});

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    className: json["class"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "class": className,
    "name": name,
    "type": type,
  };

  @override
  String toString() {
    return 'Attendance{className: $className, name: $name, type: $type}';
  }

}
