class Student {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String course;
  final String department;
  final int year;
  final int batch;
  final double cgpa;
  final double attendance;
  final int backlogs;

  final String studentType;
  final String hostelName;
  final String hostelBlock;
  final String roomNumber;
  final String bedNumber;

  final String busRoute;
  final String busStop;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.course,
    required this.department,
    required this.year,
    required this.batch,
    required this.cgpa,
    required this.attendance,
    required this.backlogs,
    required this.studentType,
    this.hostelName = '',
    this.hostelBlock = '',
    this.roomNumber = '',
    this.bedNumber = '',
    this.busRoute = '',
    this.busStop = '',
  });

  bool get isHosteller => studentType == 'Hosteller';

  bool get isDayScholar => studentType == 'Day Scholar';

  bool get attendanceWarning => attendance < 75;

  bool get hasBacklogs => backlogs > 0;
}
