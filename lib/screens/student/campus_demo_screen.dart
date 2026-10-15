
import 'package:flutter/material.dart';

class CampusDemoScreen extends StatelessWidget {
  final String route;

  const CampusDemoScreen({super.key, required this.route});

  static const Color primary = Color(0xFF3659C9);

  static const Map<String, Map<String, dynamic>> pages = {
    '/hostel': {
      'title': 'Hostel',
      'icon': Icons.apartment,
      'subtitle': 'Hostel services and room information',
      'items': [
        'Room: H-204',
        'Block: Medha Hostel',
        'Mess: Breakfast, Lunch and Dinner',
        'Maintenance Requests',
        'Hostel Outing Requests',
      ],
    },
    '/transport': {
      'title': 'Transport',
      'icon': Icons.directions_bus,
      'subtitle': 'Campus transport information',
      'items': [
        'Bus Route: Route 01',
        'Pickup: Bhimavaram Bus Stand',
        'Departure: 7:30 AM',
        'Return Bus: 4:00 PM',
        'Bus Tracking: Demo',
      ],
    },
    '/finance': {
      'title': 'Fees & Payments',
      'icon': Icons.account_balance_wallet,
      'subtitle': 'Fee structure and payment history',
      'items': [
        'Tuition Fee: ₹85,000',
        'Hostel Fee: ₹65,000',
        'Library Fee: ₹2,000',
        'Payment History',
        'Receipts: Sample data only',
      ],
    },
    '/health': {
      'title': 'Medical Centre',
      'icon': Icons.local_hospital,
      'subtitle': 'Campus health services',
      'items': [
        'Campus Medical Centre',
        'Doctor Consultation',
        'First Aid Assistance',
        'Health Appointment',
        'Emergency Contact: Contact college staff',
      ],
    },
    '/outing': {
      'title': 'SmartPass',
      'icon': Icons.qr_code_2,
      'subtitle': 'Digital ID and outing pass',
      'items': [
        'Student Digital ID',
        'Student Name: Pushkari Parimi',
        'Department: Information Technology',
        'Outing Pass: Demo',
        'QR Pass: Sample preview only',
      ],
    },
    '/clubs': {
      'title': 'Clubs & Events',
      'icon': Icons.groups,
      'subtitle': 'Campus clubs and activities',
      'items': [
        'Splashout Acting Club',
        'Technical Club',
        'Cultural Fest',
        'Hackathon Registration',
        'Upcoming Campus Events',
      ],
    },
    '/requests': {
      'title': 'My Requests',
      'icon': Icons.receipt_long,
      'subtitle': 'Track your campus requests',
      'items': [
        'Bonafide Certificate — Pending',
        'Hostel Request — In Review',
        'Leave Request — Approved',
        'New Request — Demo',
      ],
    },
    '/notifications': {
      'title': 'Notifications',
      'icon': Icons.notifications,
      'subtitle': 'Campus announcements and updates',
      'items': [
        'Internal Examination Announcement',
        'Placement Opportunity Update',
        'Campus Event Registration',
        'Academic Schedule Reminder',
      ],
    },
    '/lost-found': {
      'title': 'Lost & Found',
      'icon': Icons.search,
      'subtitle': 'Report or find campus belongings',
      'items': [
        'Found: Water Bottle',
        'Found: ID Card',
        'Reported: Notebook',
        'Report a Lost Item',
      ],
    },
    '/achievements': {
      'title': 'Achievement Passport',
      'icon': Icons.emoji_events,
      'subtitle': 'Your achievements and certificates',
      'items': [
        'Technical Event Participation',
        'Coding Practice Achievement',
        'Club Activity Certificate',
        'Hackathon Participation',
      ],
    },
    '/placements': {
      'title': 'Career Match',
      'icon': Icons.work,
      'subtitle': 'Sample internships and opportunities',
      'items': [
        'Software Engineering Internship',
        'Data Analyst Internship',
        'Java Developer Opportunity',
        'Coding Challenge',
        'Resume Preparation',
      ],
    },
    '/profile': {
      'title': 'My Profile',
      'icon': Icons.account_circle,
      'subtitle': 'Student profile information',
      'items': [
        'Name: Pushkari Parimi',
        'Course: B.Tech',
        'Department: Information Technology',
        'Year: 3rd Year',
        'CGPA: 8.53',
      ],
    },
    '/timetable': {
      'title': 'Next Class & Timetable',
      'icon': Icons.calendar_month,
      'subtitle': 'Sample class schedule',
      'items': [
        '9:00 AM — Computer Networks',
        '10:00 AM — Advanced Java',
        '11:00 AM — Full Stack Development',
        '1:00 PM — Professional Elective',
      ],
    },
    '/exams': {
      'title': 'Examinations',
      'icon': Icons.edit_note,
      'subtitle': 'Sample upcoming examinations',
      'items': [
        'Advanced Java — 20 October 2026',
        'Computer Networks — 22 October 2026',
        'Full Stack Development — 24 October 2026',
        'Check official college schedule for actual dates',
      ],
    },
    '/results': {
      'title': 'Results',
      'icon': Icons.bar_chart,
      'subtitle': 'Sample subject marks',
      'items': [
        'Advanced Java — 86/100',
        'Computer Networks — 78/100',
        'Full Stack Development — 91/100',
        'AT&CD — 73/100',
        'These marks are examples only',
      ],
    },
    '/campus': {
      'title': 'Campus Services',
      'icon': Icons.location_city,
      'subtitle': 'Campus information',
      'items': [
        'Academic Services',
        'Student Support',
        'Campus Events',
        'Student Facilities',
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final page = pages[route] ??
        {
          'title': _titleFromRoute(route),
          'icon': Icons.dashboard,
          'subtitle': 'CampusConnect sample page',
          'items': [
            'Overview',
            'Sample information',
            'Campus updates',
            'More features coming soon',
          ],
        };

    final title = page['title'] as String;
    final icon = page['icon'] as IconData;
    final subtitle = page['subtitle'] as String;
    final items = page['items'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF06B6D4)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.white, size: 42),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE8EDFF),
                  child: Icon(Icons.check_circle_outline, color: primary),
                ),
                title: Text(item),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.orange),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'This page uses sample data for demonstration. '
                      'It is not connected to a college database or '
                      'payment system.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _titleFromRoute(String path) {
    final name = path.replaceFirst('/', '').replaceAll('-', ' ');
    if (name.isEmpty) return 'CampusConnect';
    return name
        .split(' ')
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}