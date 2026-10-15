
import 'package:flutter/material.dart';

import 'theme.dart';
import 'routes.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/student/student_home_screen.dart';
import '../screens/student/academics_screen.dart';

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusConnect',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splash,

      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.studentHome: (context) =>
            const StudentHomeScreen(),
        AppRoutes.academics: (context) =>
            const AcademicsScreen(),
      },

      onGenerateRoute: (settings) {
        final routeName = settings.name ?? '/unknown';

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CampusDemoPage(
            routeName: routeName,
          ),
        );
      },
    );
  }
}

class CampusDemoPage extends StatelessWidget {
  final String routeName;

  const CampusDemoPage({
    super.key,
    required this.routeName,
  });

  String get pageTitle {
    switch (routeName) {
      case AppRoutes.facultyHome:
        return 'Faculty Dashboard';
      case AppRoutes.adminHome:
      case AppRoutes.adminDashboard:
        return 'Admin Dashboard';
      case AppRoutes.campus:
        return 'Campus Services';
      case AppRoutes.finance:
        return 'Fees & Payments';
      case AppRoutes.health:
        return 'Medical Centre';
      case AppRoutes.outing:
        return 'SmartPass';
      case AppRoutes.hostel:
        return 'Hostel';
      case AppRoutes.transport:
        return 'Transport';
      case AppRoutes.clubs:
        return 'Clubs & Events';
      case AppRoutes.requests:
        return 'My Requests';
      case AppRoutes.achievements:
        return 'Achievement Passport';
      case AppRoutes.lostFound:
        return 'Lost & Found';
      case AppRoutes.notifications:
        return 'Notifications';
      case AppRoutes.profile:
        return 'Student Profile';
      case AppRoutes.timetable:
        return 'Timetable';
      case AppRoutes.attendance:
        return 'Attendance';
      case AppRoutes.exams:
        return 'Examinations';
      case AppRoutes.results:
        return 'Results';
      case AppRoutes.placements:
        return 'Placements & Careers';
      case AppRoutes.facultyMentoring:
        return 'Faculty Mentoring';
      case AppRoutes.facultyLeave:
        return 'Faculty Leave';
      case AppRoutes.facultySalary:
        return 'Faculty Salary';
      case AppRoutes.meetings:
        return 'Meetings';
      case AppRoutes.adminControl:
        return 'Admin Controls';
      case AppRoutes.adminAnnouncements:
        return 'Admin Announcements';
      default:
        return 'CampusConnect Demo';
    }
  }

  String get pageDescription {
    switch (routeName) {
      case AppRoutes.hostel:
        return 'View room details, mess information and maintenance requests.';
      case AppRoutes.transport:
        return 'Explore bus routes, stops and transport information.';
      case AppRoutes.finance:
        return 'View fee details, payment history and receipts.';
      case AppRoutes.health:
        return 'View medical services and health request information.';
      case AppRoutes.outing:
        return 'View your digital ID and outing pass information.';
      case AppRoutes.clubs:
        return 'Explore clubs, campus events and registrations.';
      case AppRoutes.requests:
        return 'View your submitted campus requests.';
      case AppRoutes.achievements:
        return 'View achievements, certificates and activities.';
      case AppRoutes.lostFound:
        return 'Report or search for items lost on campus.';
      case AppRoutes.notifications:
        return 'View campus announcements and notifications.';
      case AppRoutes.timetable:
        return 'View your class schedule.';
      case AppRoutes.exams:
        return 'View examination schedules and details.';
      case AppRoutes.results:
        return 'View academic results and marks.';
      case AppRoutes.placements:
        return 'Explore placement opportunities and career resources.';
      default:
        return 'This CampusConnect section is ready for demo content.';
    }
  }

  IconData get pageIcon {
    switch (routeName) {
      case AppRoutes.hostel:
        return Icons.apartment_rounded;
      case AppRoutes.transport:
        return Icons.directions_bus_rounded;
      case AppRoutes.finance:
        return Icons.account_balance_wallet_rounded;
      case AppRoutes.health:
        return Icons.medical_services_rounded;
      case AppRoutes.outing:
        return Icons.qr_code_rounded;
      case AppRoutes.clubs:
        return Icons.groups_rounded;
      case AppRoutes.requests:
        return Icons.assignment_rounded;
      case AppRoutes.achievements:
        return Icons.emoji_events_rounded;
      case AppRoutes.lostFound:
        return Icons.search_rounded;
      case AppRoutes.notifications:
        return Icons.notifications_active_rounded;
      case AppRoutes.timetable:
        return Icons.calendar_month_rounded;
      case AppRoutes.exams:
        return Icons.assignment_turned_in_rounded;
      case AppRoutes.results:
        return Icons.school_rounded;
      case AppRoutes.placements:
        return Icons.work_rounded;
      case AppRoutes.profile:
        return Icons.person_rounded;
      default:
        return Icons.dashboard_customize_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF5146E5),
                  Color(0xFF06B6D4),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(
                  pageIcon,
                  size: 54,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Text(
                  pageTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  pageDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Quick Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _infoTile(
            Icons.check_circle_outline,
            'Demo page opened successfully',
            'Navigation is working for this route.',
          ),
          _infoTile(
            Icons.info_outline,
            'Sample content',
            'We can add detailed features and sample data next.',
          ),
          _infoTile(
            Icons.phone_android,
            'CampusConnect',
            'Designed for students and campus services.',
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.studentHome,
                (route) => false,
              );
            },
            icon: const Icon(Icons.home_rounded),
            label: const Text('Back to Dashboard'),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF5146E5),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
