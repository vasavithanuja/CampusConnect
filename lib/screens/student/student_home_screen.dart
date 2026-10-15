import 'package:flutter/material.dart';



import '../../data/demo_data.dart';

import '../../data/club_data.dart';

import '../../services/local_app_state.dart';

import '../../widgets/app_card.dart';

import '../../widgets/dashboard_tile.dart';

import '../../widgets/notification_card.dart';

import '../../widgets/section_title.dart';

import 'backlog_fee_screen.dart';
import 'bus_tracking_screen.dart';



class StudentHomeScreen extends StatefulWidget {

  const StudentHomeScreen({super.key});



  @override

  State<StudentHomeScreen> createState() => _StudentHomeScreenState();

}



class _StudentHomeScreenState extends State<StudentHomeScreen> {

  final LocalAppState appState = LocalAppState.instance;



  @override

  void initState() {

    super.initState();



    appState.loginStudent(DemoData.student);



    appState.initialize(

      demoRequests: DemoData.requests,

      demoNotifications: DemoData.notifications,

      demoClubs: ClubData.clubs,

      demoEvents: DemoData.events,

      demoOpportunities: DemoData.opportunities,

      demoTimetable: DemoData.timetable,

      demoExams: DemoData.exams,

      demoAchievements: DemoData.achievements,

    );

  }



  @override

  Widget build(BuildContext context) {

    final student = DemoData.student;



    return Scaffold(

      appBar: AppBar(

        title: const Text(

          'CampusConnect',

          style: TextStyle(fontWeight: FontWeight.w900),

        ),

        actions: [

          IconButton(

            onPressed: () {

              Navigator.pushNamed(context, '/notifications');

            },

            icon: Badge(

              label: Text('${appState.unreadNotificationCount}'),

              child: const Icon(Icons.notifications_none_rounded),

            ),

          ),

          IconButton(

            onPressed: () {

              Navigator.pushNamed(context, '/profile');

            },

            icon: const Icon(Icons.account_circle_outlined),

          ),

        ],

      ),



      body: RefreshIndicator(

        onRefresh: () async {

          setState(() {});

        },



        child: ListView(

          padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),

          children: [

            // ==========================================

            // GREETING

            // ==========================================

            Text(

              'Good Morning 👋',

              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),

            ),



            const SizedBox(height: 4),



            Text(

              student.name,

              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900),

            ),



            const SizedBox(height: 4),



            Text(

              '${student.course} ${student.department} • '

              '${student.year}rd Year',

              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),

            ),



            const SizedBox(height: 18),



            // ==========================================

            // CAMPUS PRIORITY SCORE

            // ==========================================

            AppCard(

              padding: EdgeInsets.zero,

              child: Container(

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(18),

                  gradient: const LinearGradient(

                    colors: [Color(0xFF4F46E5), Color(0xFF06B6D4)],

                  ),

                ),

                child: Row(

                  children: [

                    SizedBox(

                      width: 75,

                      height: 75,

                      child: Stack(

                        alignment: Alignment.center,

                        children: [

                          CircularProgressIndicator(

                            value: appState.campusPriorityScore / 100,

                            strokeWidth: 7,

                            backgroundColor: Colors.white24,

                            valueColor: const AlwaysStoppedAnimation<Color>(

                              Colors.white,

                            ),

                          ),

                          Text(

                            '${appState.campusPriorityScore.toInt()}',

                            style: const TextStyle(

                              color: Colors.white,

                              fontSize: 20,

                              fontWeight: FontWeight.w900,

                            ),

                          ),

                        ],

                      ),

                    ),



                    const SizedBox(width: 18),



                    Expanded(

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          const Text(

                            'Campus Priority Score',

                            style: TextStyle(

                              color: Colors.white,

                              fontSize: 17,

                              fontWeight: FontWeight.w900,

                            ),

                          ),

                          const SizedBox(height: 6),

                          Text(

                            appState.priorityMessage,

                            style: const TextStyle(

                              color: Colors.white70,

                              fontSize: 12,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ],

                ),

              ),

            ),



            const SizedBox(height: 12),



            // ==========================================

            // ACADEMIC STATS

            // ==========================================

            Row(

              children: [

                Expanded(

                  child: _StatCard(

                    title: 'Attendance',

                    value: '${student.attendance.toInt()}%',

                    icon: Icons.fact_check_outlined,

                    color: Colors.green,

                  ),

                ),



                const SizedBox(width: 10),



                Expanded(

                  child: _StatCard(

                    title: 'CGPA',

                    value: student.cgpa.toStringAsFixed(2),

                    icon: Icons.school_outlined,

                    color: Colors.indigo,

                  ),

                ),



                const SizedBox(width: 10),





Expanded(

  child: InkWell(

    borderRadius: BorderRadius.circular(16),

    onTap: () {

      Navigator.push(

        context,

        MaterialPageRoute(

          builder: (_) => const BacklogFeeScreen(),

        ),

      );

    },

    child: _StatCard(

      title: 'Backlogs',

      value: '${student.backlogs}',

      icon: Icons.warning_amber_rounded,

      color: student.backlogs == 0 ? Colors.green : Colors.red,

    ),

  ),

),





            // ==========================================

        ],
      ),

            // ACADEMIC TWIN

            // ==========================================

            AppCard(

              onTap: () {

                Navigator.pushNamed(context, '/academics');

              },

              child: Row(

                children: [

                  Container(

                    width: 48,

                    height: 48,

                    decoration: BoxDecoration(

                      color: Colors.deepPurple.withValues(alpha: 0.1),

                      borderRadius: BorderRadius.circular(14),

                    ),

                    child: const Icon(

                      Icons.psychology_alt_rounded,

                      color: Colors.deepPurple,

                    ),

                  ),



                  const SizedBox(width: 14),



                  Expanded(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        const Text(

                          'Academic Twin',

                          style: TextStyle(fontWeight: FontWeight.w900),

                        ),

                        const SizedBox(height: 4),

                        Text(

                          'Academic status: Strong • '

                          'Attendance: Safe',

                          style: TextStyle(

                            color: Colors.grey.shade600,

                            fontSize: 12,

                          ),

                        ),

                      ],

                    ),

                  ),



                  const Icon(Icons.arrow_forward_ios_rounded, size: 15),

                ],

              ),

            ),



            // ==========================================

            // SMART NOTIFICATIONS

            // ==========================================

            SectionTitle(

              title: 'Smart Notifications',

              actionText: 'View All',

              onAction: () {

                Navigator.pushNamed(context, '/notifications');

              },

            ),



            ...appState.notifications

                .take(2)

                .map(

                  (notification) =>

                      NotificationCard(notification: notification),

                ),



            // ==========================================

            // TODAY'S CAMPUS

            // ==========================================

            const SectionTitle(title: "Today's Campus"),



            DashboardTile(

              title: 'Next Class',

              subtitle: 'Computer Networks • 09:00 AM • IT-301',

              icon: Icons.class_outlined,

              color: Colors.blue,

              onTap: () {

                Navigator.pushNamed(context, '/timetable');

              },

            ),



            DashboardTile(

              title: 'Upcoming Exam',

              subtitle: 'Computer Networks • 14-10-2026',

              icon: Icons.assignment_outlined,

              color: Colors.orange,

              onTap: () {

                Navigator.pushNamed(context, '/exams');

              },

            ),



            DashboardTile(

              title: 'Career Match',

              subtitle:

                  '${appState.opportunities.length} opportunities '

                  'match your profile',

              icon: Icons.work_outline_rounded,

              color: Colors.green,

              onTap: () {

                Navigator.pushNamed(context, '/placements');

              },

            ),



            // ==========================================

            // CAMPUS SERVICES

            // ==========================================

            const SectionTitle(title: 'Campus Services'),



            DashboardTile(

              title: 'Academics',

              subtitle: 'Attendance, marks, exams & results',

              icon: Icons.school_outlined,

              color: Colors.indigo,

              onTap: () {

                Navigator.pushNamed(context, '/academics');

              },

            ),



            DashboardTile(

              title: 'Hostel',

              subtitle: 'Room, mess, maintenance & outing',

              icon: Icons.apartment_outlined,

              color: Colors.deepPurple,

              onTap: () {

                Navigator.pushNamed(context, '/hostel');

              },

            ),



DashboardTile(
  title: 'Transport',
  subtitle: 'Routes, stops & bus tracking demo',
  icon: Icons.directions_bus_outlined,
  color: Colors.teal,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BusTrackingScreen(),
      ),
    );
  },
),




            DashboardTile(

              title: 'Fees & Payments',

              subtitle: 'Fee structure, history & receipts',

              icon: Icons.account_balance_wallet_outlined,

              color: Colors.orange,

              onTap: () {

                Navigator.pushNamed(context, '/finance');

              },

            ),



            DashboardTile(

              title: 'Medical Centre',

              subtitle: 'Doctors, hospital & health requests',

              icon: Icons.local_hospital_outlined,

              color: Colors.red,

              onTap: () {

                Navigator.pushNamed(context, '/health');

              },

            ),



            DashboardTile(

              title: 'SmartPass',

              subtitle: 'Digital ID, QR & outing pass',

              icon: Icons.qr_code_2_rounded,

              color: Colors.purple,

              onTap: () {

                Navigator.pushNamed(context, '/outing');

              },

            ),



            // ==========================================

            // STUDENT LIFE

            // ==========================================

            const SectionTitle(title: 'Student Life'),



            DashboardTile(

              title: 'Clubs & Events',

              subtitle:

                  '${appState.clubs.length} clubs, '

                  'events & registrations',

              icon: Icons.groups_outlined,

              color: Colors.pink,

              onTap: () {

                Navigator.pushNamed(context, '/clubs');

              },

            ),



            DashboardTile(

              title: 'My Requests',

              subtitle: '${appState.requests.length} active requests',

              icon: Icons.receipt_long_outlined,

              color: Colors.blueGrey,

              onTap: () {

                Navigator.pushNamed(context, '/requests');

              },

            ),



            DashboardTile(

              title: 'Achievement Passport',

              subtitle: '${appState.achievements.length} achievements',

              icon: Icons.emoji_events_outlined,

              color: Colors.amber.shade800,

              onTap: () {

                Navigator.pushNamed(context, '/achievements');

              },

            ),



            DashboardTile(

              title: 'Lost & Found',

              subtitle: 'Report or find campus items',

              icon: Icons.search_rounded,

              color: Colors.brown,

              onTap: () {

                Navigator.pushNamed(context, '/lost-found');

              },

            ),



            const SizedBox(height: 10),



            // ==========================================

            // GLOBAL SEARCH

            // ==========================================

            AppCard(

              onTap: () {

                _showSearchDialog();

              },

              child: Row(

                children: [

                  const Icon(Icons.search_rounded, color: Colors.grey),



                  const SizedBox(width: 12),



                  Expanded(

                    child: Text(

                      'Search anything on campus...',

                      style: TextStyle(color: Colors.grey.shade600),

                    ),

                  ),



                  const Icon(Icons.arrow_forward_ios_rounded, size: 15),

                ],

              ),

            ),



            const SizedBox(height: 10),



            // ==========================================

            // FOOTER

            // ==========================================

               Center(

              child: Text(

                'CampusConnect • Everything on Campus, One Place.',

                textAlign: TextAlign.center,

                style: TextStyle(

                  color: Colors.grey.shade500,

                  fontSize: 11,

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

  // ================================================

  // SEARCH DIALOG

  // ================================================



  void _showSearchDialog() {

    final controller = TextEditingController();



    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text(

            'Campus Search',

            style: TextStyle(fontWeight: FontWeight.w900),

          ),

          content: TextField(

            controller: controller,

            autofocus: true,

            decoration: const InputDecoration(

              hintText: 'Search classes, clubs, events...',

              prefixIcon: Icon(Icons.search_rounded),

            ),

          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child: const Text('Cancel'),

            ),

            FilledButton(

              onPressed: () {

                final query = controller.text.trim();



                Navigator.pop(context);



                if (query.isNotEmpty) {

                  ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(

                      content: Text('Searching CampusConnect for "$query"'),

                    ),

                  );

                }

              },

              child: const Text('Search'),

            ),

          ],

        );

      },

    );

  }

}



// ====================================================

// STAT CARD

// ====================================================



class _StatCard extends StatelessWidget {

  final String title;

  final String value;

  final IconData icon;

  final Color color;



  const _StatCard({

    required this.title,

    required this.value,

    required this.icon,

    required this.color,

  });



  @override

  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(13),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Icon(icon, color: color, size: 22),



            const SizedBox(height: 10),



            Text(

              value,

              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),

            ),



            const SizedBox(height: 3),



            Text(

              title,

              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),

            ),

          ],

        ),

      ),

    );

  }

}
