import '../models/student.dart';
import '../models/faculty.dart';
import '../models/request.dart';
import '../models/notification.dart';
import '../models/club.dart';
import '../models/event.dart';
import '../models/placement.dart';
import '../models/timetable.dart';
import '../models/exam.dart';
import '../models/achievement.dart';

class LocalAppState {
  LocalAppState._();

  static final LocalAppState instance = LocalAppState._();

  Student? currentStudent;
  Faculty? currentFaculty;

  String? currentRole;

  bool isLoggedIn = false;

  List<CampusRequest> requests = [];
  List<CampusNotification> notifications = [];
  List<Club> clubs = [];
  List<CampusEvent> events = [];
  List<PlacementOpportunity> opportunities = [];
  List<TimetableEntry> timetable = [];
  List<Exam> exams = [];
  List<Achievement> achievements = [];

  // --------------------------------------------------
  // LOGIN
  // --------------------------------------------------

  void loginStudent(Student student) {
    currentStudent = student;
    currentFaculty = null;

    currentRole = 'Student';
    isLoggedIn = true;
  }

  void loginFaculty(Faculty faculty) {
    currentFaculty = faculty;
    currentStudent = null;

    currentRole = 'Faculty';
    isLoggedIn = true;
  }

  void loginAdmin() {
    currentStudent = null;
    currentFaculty = null;

    currentRole = 'Admin';
    isLoggedIn = true;
  }

  // --------------------------------------------------
  // LOGOUT
  // --------------------------------------------------

  void logout() {
    currentStudent = null;
    currentFaculty = null;

    currentRole = null;
    isLoggedIn = false;
  }

  // --------------------------------------------------
  // REQUESTS
  // --------------------------------------------------

  void addRequest(CampusRequest request) {
    requests.insert(0, request);
  }

  void updateRequestStatus(String requestId, RequestStatus status) {
    final index = requests.indexWhere((request) => request.id == requestId);

    if (index != -1) {
      requests[index].status = status;
    }
  }

  CampusRequest? findRequest(String requestId) {
    for (final request in requests) {
      if (request.id == requestId) {
        return request;
      }
    }

    return null;
  }

  // --------------------------------------------------
  // NOTIFICATIONS
  // --------------------------------------------------

  void markNotificationRead(String notificationId) {
    final index = notifications.indexWhere(
      (notification) => notification.id == notificationId,
    );

    if (index != -1) {
      notifications[index].status = NotificationStatus.read;
    }
  }

  int get unreadNotificationCount {
    return notifications.where((notification) => notification.isUnread).length;
  }

  // --------------------------------------------------
  // STUDENT INFORMATION
  // --------------------------------------------------

  double get campusPriorityScore {
    final student = currentStudent;

    if (student == null) {
      return 0;
    }

    double score = 50;

    if (student.attendance >= 85) {
      score += 15;
    } else if (student.attendance >= 75) {
      score += 8;
    }

    if (student.cgpa >= 8.5) {
      score += 15;
    } else if (student.cgpa >= 7.5) {
      score += 8;
    }

    if (student.backlogs == 0) {
      score += 10;
    }

    score += 10;

    return score.clamp(0, 100);
  }

  String get priorityMessage {
    final score = campusPriorityScore;

    if (score >= 90) {
      return 'Excellent campus readiness';
    }

    if (score >= 75) {
      return 'You are doing well';
    }

    if (score >= 60) {
      return 'A few areas need attention';
    }

    return 'Some important actions are pending';
  }

  // --------------------------------------------------
  // ACADEMIC TWIN
  // --------------------------------------------------

  Map<String, dynamic> get academicTwin {
    final student = currentStudent;

    if (student == null) {
      return {};
    }

    return {
      'CGPA': student.cgpa,
      'Attendance': student.attendance,
      'Backlogs': student.backlogs,
      'AcademicStatus': student.cgpa >= 8.0 ? 'Strong' : 'Needs Improvement',
      'AttendanceStatus': student.attendance >= 75 ? 'Safe' : 'Warning',
      'BacklogStatus': student.backlogs == 0 ? 'Clear' : 'Attention Required',
    };
  }

  // --------------------------------------------------
  // INITIALIZE DEMO DATA
  // --------------------------------------------------

  void initialize({
    required List<CampusRequest> demoRequests,
    required List<CampusNotification> demoNotifications,
    required List<Club> demoClubs,
    required List<CampusEvent> demoEvents,
    required List<PlacementOpportunity> demoOpportunities,
    required List<TimetableEntry> demoTimetable,
    required List<Exam> demoExams,
    required List<Achievement> demoAchievements,
  }) {
    requests = List.from(demoRequests);
    notifications = List.from(demoNotifications);
    clubs = List.from(demoClubs);
    events = List.from(demoEvents);
    opportunities = List.from(demoOpportunities);
    timetable = List.from(demoTimetable);
    exams = List.from(demoExams);
    achievements = List.from(demoAchievements);
  }
}
