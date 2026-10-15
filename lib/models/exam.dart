class Exam {
  final String id;
  final String subject;
  final String date;
  final String time;
  final String room;
  final String block;
  final String examType;
  final bool hallTicketAvailable;

  Exam({
    required this.id,
    required this.subject,
    required this.date,
    required this.time,
    required this.room,
    required this.block,
    required this.examType,
    required this.hallTicketAvailable,
  });
}

class SubjectResult {
  final String subject;
  final int marks;
  final String grade;
  final double gradePoint;
  final int credits;

  SubjectResult({
    required this.subject,
    required this.marks,
    required this.grade,
    required this.gradePoint,
    required this.credits,
  });
}

class SemesterResult {
  final String semester;
  final double sgpa;
  final double cgpa;
  final List<SubjectResult> subjects;

  SemesterResult({
    required this.semester,
    required this.sgpa,
    required this.cgpa,
    required this.subjects,
  });
}
