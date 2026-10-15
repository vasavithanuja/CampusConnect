class TimetableEntry {
  final String day;
  final String startTime;
  final String endTime;

  final String subject;
  final String faculty;
  final String room;

  final bool isLab;

  TimetableEntry({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.faculty,
    required this.room,
    required this.isLab,
  });
}
