
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF3659C9);

// =====================================================
// ACADEMICS HOME SCREEN
// =====================================================

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  static const List<Map<String, dynamic>> modules = [
    {
      'title': 'Timetable',
      'subtitle': 'Your weekly class schedule',
      'icon': Icons.calendar_month_rounded,
      'color': Colors.blue,
    },
    {
      'title': 'Attendance',
      'subtitle': 'Subject-wise attendance percentage',
      'icon': Icons.fact_check_rounded,
      'color': Colors.green,
    },
    {
      'title': 'Assignments',
      'subtitle': 'Assignments and due dates',
      'icon': Icons.assignment_rounded,
      'color': Colors.orange,
    },
    {
      'title': 'Examinations',
      'subtitle': 'Exam schedules and updates',
      'icon': Icons.edit_note_rounded,
      'color': Colors.purple,
    },
    {
      'title': 'Results',
      'subtitle': 'Marks and academic performance',
      'icon': Icons.bar_chart_rounded,
      'color': Colors.teal,
    },
    {
      'title': 'Study Materials',
      'subtitle': 'Notes and learning resources',
      'icon': Icons.menu_book_rounded,
      'color': Colors.pink,
    },
  ];

  void openModule(BuildContext context, String title) {
    Widget page;

    switch (title) {
      case 'Timetable':
        page = const TimetableScreen();
        break;
      case 'Attendance':
        page = const AttendanceScreen();
        break;
      case 'Assignments':
        page = const AssignmentsScreen();
        break;
      case 'Examinations':
        page = const ExaminationsScreen();
        break;
      case 'Results':
        page = const ResultsScreen();
        break;
      case 'Study Materials':
        page = const StudyMaterialsScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Academics')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Academic Services',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Manage your academic activities in one place.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ...modules.map((module) {
            final color = module['color'] as Color;
            final title = module['title'] as String;

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: CircleAvatar(
                  backgroundColor: color.withValues(alpha: 0.12),
                  child: Icon(module['icon'] as IconData, color: color),
                ),
                title: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(module['subtitle'] as String),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => openModule(context, title),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// =====================================================
// TIMETABLE
// =====================================================

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  static const Map<String, List<String>> schedule = {
    'Monday': [
      'Advanced Java',
      'Computer Networks',
      'FSD',
      'AT&CD',
      'OE-I',
    ],
    'Tuesday': [
      'Computer Networks',
      'UIDF',
      'Advanced Java',
      'PE-I',
      'FSD',
    ],
    'Wednesday': [
      'Advanced Java',
      'OE-I',
      'FSD',
      'PE-I',
      'Computer Networks',
    ],
    'Thursday': [
      'PE-I',
      'Computer Networks',
      'AT&CD',
      'Advanced Java',
      'CN Lab / Java Lab',
    ],
    'Friday': [
      'UIDF',
      'FSD',
      'AT&CD',
      'Computer Networks',
      'PE-I',
    ],
    'Saturday': [
      'FSD',
      'Advanced Java',
      'Computer Networks',
      'Counselling',
      'UIDF',
    ],
  };

  static const List<String> times = [
    '8:00 – 8:50 AM',
    '8:50 – 9:40 AM',
    '10:00 – 10:50 AM',
    '10:50 – 11:40 AM',
    '1:00 – 1:50 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Timetable')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _InfoBanner(
            icon: Icons.school_rounded,
            title: 'III B.Tech IT – B',
            subtitle: 'Monday – Saturday • Sample timetable',
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.restaurant, color: Colors.orange),
              title: Text('Lunch Break'),
              subtitle: Text('11:40 AM – 1:00 PM'),
            ),
          ),
          const SizedBox(height: 12),
          ...schedule.entries.map(
            (entry) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                leading: const Icon(
                  Icons.calendar_today,
                  color: primaryColor,
                ),
                title: Text(
                  entry.key,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Tap to view classes'),
                children: [
                  ...entry.value.asMap().entries.map(
                    (subject) => ListTile(
                      leading: const Icon(Icons.access_time),
                      title: Text(subject.value),
                      subtitle: Text(
                        subject.key < times.length
                            ? times[subject.key]
                            : 'Lab period',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const _DemoNotice(),
        ],
      ),
    );
  }
}

// =====================================================
// ATTENDANCE
// =====================================================

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  static const List<Map<String, dynamic>> subjects = [
    {'name': 'Advanced Java', 'attended': 18, 'total': 20},
    {'name': 'Computer Networks', 'attended': 16, 'total': 20},
    {'name': 'FSD', 'attended': 19, 'total': 22},
    {'name': 'AT&CD', 'attended': 15, 'total': 20},
    {'name': 'UIDF', 'attended': 17, 'total': 20},
    {'name': 'PE-I', 'attended': 18, 'total': 20},
    {'name': 'OE-I', 'attended': 16, 'total': 20},
  ];

  @override
  Widget build(BuildContext context) {
    final attended = subjects.fold<int>(
      0,
      (sum, item) => sum + (item['attended'] as int),
    );
    final total = subjects.fold<int>(
      0,
      (sum, item) => sum + (item['total'] as int),
    );
    final overall = attended / total;

    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoBanner(
            icon: Icons.fact_check_rounded,
            title: '${(overall * 100).toStringAsFixed(1)}%',
            subtitle: 'Overall attendance • $attended of $total classes',
          ),
          const SizedBox(height: 20),
          const Text(
            'Subject-wise Attendance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...subjects.map((item) {
            final count = item['attended'] as int;
            final totalCount = item['total'] as int;
            final percentage = count / totalCount;
            final color = percentage >= 0.75 ? Colors.green : Colors.red;

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item['name'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          '${(percentage * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: percentage,
                      minHeight: 8,
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(height: 8),
                    Text('$count attended • ${totalCount - count} missed'),
                  ],
                ),
              ),
            );
          }),
          const _DemoNotice(),
        ],
      ),
    );
  }
}

// =====================================================
// ASSIGNMENTS
// =====================================================

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  static const List<Map<String, String>> assignments = [
    {
      'subject': 'Advanced Java',
      'task': 'Servlets and JSP Assignment',
      'due': '15 October 2026',
      'status': 'Pending',
    },
    {
      'subject': 'Computer Networks',
      'task': 'TCP/IP Model Notes',
      'due': '17 October 2026',
      'status': 'Pending',
    },
    {
      'subject': 'FSD',
      'task': 'Responsive Web Page',
      'due': '19 October 2026',
      'status': 'In Progress',
    },
    {
      'subject': 'AT&CD',
      'task': 'Grammar and Automata Problems',
      'due': '21 October 2026',
      'status': 'Pending',
    },
    {
      'subject': 'UIDF',
      'task': 'Mobile App UI Design',
      'due': '23 October 2026',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _InfoBanner(
            icon: Icons.assignment_rounded,
            title: 'My Assignments',
            subtitle: 'Track tasks, due dates and completion status',
          ),
          const SizedBox(height: 16),
          ...assignments.map((item) {
            final completed = item['status'] == 'Completed';

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  backgroundColor: completed
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                  child: Icon(
                    completed ? Icons.check_circle : Icons.assignment,
                    color: completed ? Colors.green : Colors.orange,
                  ),
                ),
                title: Text(
                  item['task']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${item['subject']}\nDue: ${item['due']}\nStatus: ${item['status']}',
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          }),
          const _DemoNotice(),
        ],
      ),
    );
  }
}

// =====================================================
// EXAMINATIONS
// =====================================================

class ExaminationsScreen extends StatelessWidget {
  const ExaminationsScreen({super.key});

  static const List<Map<String, String>> exams = [
    {
      'subject': 'Advanced Java',
      'date': '20 October 2026',
      'time': '9:30 AM – 12:30 PM',
      'type': 'Internal Assessment',
    },
    {
      'subject': 'Computer Networks',
      'date': '22 October 2026',
      'time': '9:30 AM – 12:30 PM',
      'type': 'Internal Assessment',
    },
    {
      'subject': 'FSD',
      'date': '24 October 2026',
      'time': '1:30 PM – 4:30 PM',
      'type': 'Internal Assessment',
    },
    {
      'subject': 'AT&CD',
      'date': '27 October 2026',
      'time': '9:30 AM – 12:30 PM',
      'type': 'Internal Assessment',
    },
    {
      'subject': 'UIDF',
      'date': '29 October 2026',
      'time': '1:30 PM – 4:30 PM',
      'type': 'Internal Assessment',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Examinations')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _InfoBanner(
            icon: Icons.edit_note_rounded,
            title: 'Exam Schedule',
            subtitle: 'Upcoming examinations and timings',
          ),
          const SizedBox(height: 16),
          ...exams.map(
            (exam) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                isThreeLine: true,
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFEDE7F6),
                  child: Icon(
                    Icons.event_note,
                    color: Colors.purple,
                  ),
                ),
                title: Text(
                  exam['subject']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${exam['type']}\n${exam['date']}\n${exam['time']}',
                ),
              ),
            ),
          ),
          const _DemoNotice(),
        ],
      ),
    );
  }
}

// =====================================================
// RESULTS
// =====================================================

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  static const List<Map<String, dynamic>> marks = [
    {'subject': 'Advanced Java', 'marks': 86, 'total': 100},
    {'subject': 'Computer Networks', 'marks': 78, 'total': 100},
    {'subject': 'FSD', 'marks': 91, 'total': 100},
    {'subject': 'AT&CD', 'marks': 73, 'total': 100},
    {'subject': 'UIDF', 'marks': 88, 'total': 100},
    {'subject': 'PE-I', 'marks': 82, 'total': 100},
  ];

  @override
  Widget build(BuildContext context) {
    final totalMarks = marks.fold<int>(
      0,
      (sum, item) => sum + (item['marks'] as int),
    );
    final maxMarks = marks.fold<int>(
      0,
      (sum, item) => sum + (item['total'] as int),
    );
    final percentage = totalMarks / maxMarks * 100;

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoBanner(
            icon: Icons.bar_chart_rounded,
            title: '${percentage.toStringAsFixed(1)}%',
            subtitle: 'Sample overall percentage',
          ),
          const SizedBox(height: 20),
          const Text(
            'Subject-wise Marks',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...marks.map((item) {
            final score = item['marks'] as int;
            final maximum = item['total'] as int;

            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE0F2F1),
                  child: Icon(Icons.school, color: Colors.teal),
                ),
                title: Text(item['subject'] as String),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: LinearProgressIndicator(
                    value: score / maximum,
                    color: Colors.teal,
                    minHeight: 7,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                trailing: Text(
                  '$score/$maximum',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
          const _DemoNotice(),
        ],
      ),
    );
  }
}

// =====================================================
// STUDY MATERIALS
// =====================================================

class StudyMaterialsScreen extends StatelessWidget {
  const StudyMaterialsScreen({super.key});

  static const List<Map<String, String>> materials = [
    {
      'subject': 'Advanced Java',
      'name': 'Servlets and JSP Notes',
      'type': 'PDF Notes',
    },
    {
      'subject': 'Computer Networks',
      'name': 'TCP/IP Model and Routing',
      'type': 'Study Notes',
    },
    {
      'subject': 'FSD',
      'name': 'HTML, CSS and JavaScript',
      'type': 'Practice Material',
    },
    {
      'subject': 'AT&CD',
      'name': 'Finite Automata and Grammars',
      'type': 'Unit Notes',
    },
    {
      'subject': 'UIDF',
      'name': 'UI Design Fundamentals',
      'type': 'Design Material',
    },
    {
      'subject': 'PE-I',
      'name': 'Important Questions',
      'type': 'Question Bank',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Materials')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _InfoBanner(
            icon: Icons.menu_book_rounded,
            title: 'Learning Resources',
            subtitle: 'Browse subject-wise notes and practice material',
          ),
          const SizedBox(height: 16),
          ...materials.map(
            (item) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFCE4EC),
                  child: Icon(Icons.description, color: Colors.pink),
                ),
                title: Text(
                  item['name']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${item['subject']} • ${item['type']}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MaterialDetailScreen(
                        title: item['name']!,
                        subject: item['subject']!,
                        type: item['type']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const _DemoNotice(),
        ],
      ),
    );
  }
}

// =====================================================
// MATERIAL DETAIL
// =====================================================

class MaterialDetailScreen extends StatelessWidget {
  final String title;
  final String subject;
  final String type;

  const MaterialDetailScreen({
    super.key,
    required this.title,
    required this.subject,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Details')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.menu_book_rounded,
                    size: 56,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Subject: $subject'),
                  const SizedBox(height: 6),
                  Text('Type: $type'),
                  const SizedBox(height: 16),
                  const Text(
                    'This is a sample material preview. '
                    'Actual PDF files and download links can be added later.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Materials'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// REUSABLE WIDGETS
// =====================================================

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoBanner({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, size: 42, color: Colors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoNotice extends StatelessWidget {
  const _DemoNotice();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: Colors.orange),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Demo data only. Exam dates, marks, attendance and '
                'assignments are examples, not official college records.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}