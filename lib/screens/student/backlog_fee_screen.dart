
import 'package:flutter/material.dart';

class BacklogFeeScreen extends StatefulWidget {
  const BacklogFeeScreen({super.key});

  @override
  State<BacklogFeeScreen> createState() => _BacklogFeeScreenState();
}

class _BacklogFeeScreenState extends State<BacklogFeeScreen> {
  static const double feePerSubject = 500;

  final List<Map<String, dynamic>> subjects = [
    {'name': 'Computer Networks', 'code': 'UGCS5T0223'},
    {'name': 'Advanced Java', 'code': 'UGIT5T0123'},
    {'name': 'Automata Theory & Compiler Design', 'code': 'UGIT5T0223'},
    {'name': 'Data Structures', 'code': 'SAMPLE-DS'},
  ];

  final Set<String> selectedSubjects = {};

  String money(double amount) => '₹${amount.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final total = selectedSubjects.length * feePerSubject;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Backlog Exam Fee'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EDFF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.assignment_late_outlined,
                  size: 36,
                  color: Color(0xFF3659C9),
                ),
                SizedBox(height: 12),
                Text(
                  'Backlog Examination Fee',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Select the subjects for which you want to '
                  'register for supplementary examinations.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'Select Backlog Subjects',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sample subjects and fee only. Verify the official '
            'subject list and fee with your college.',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),

          ...subjects.map((subject) {
            final name = subject['name'] as String;
            final code = subject['code'] as String;
            final selected = selectedSubjects.contains(name);

            return Card(
              child: CheckboxListTile(
                value: selected,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(name),
                subtitle: Text('Subject code: $code'),
                secondary: Text(
                  money(feePerSubject),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      selectedSubjects.add(name);
                    } else {
                      selectedSubjects.remove(name);
                    }
                  });
                },
              ),
            );
          }),

          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fee Summary',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _row('Selected subjects',
                      '${selectedSubjects.length}'),
                  _row('Fee per subject', money(feePerSubject)),
                  const Divider(height: 24),
                  _row('Total fee', money(total), bold: true),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),

          SizedBox(
            height: 50,
            child: FilledButton.icon(
              icon: const Icon(Icons.payment),
              label: const Text('Proceed to Payment'),
              onPressed: selectedSubjects.isEmpty
                  ? null
                  : () {
                      showDialog<void>(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const Text('Demo Payment'),
                          content: Text(
                            'Selected subjects: '
                            '${selectedSubjects.join(', ')}\n\n'
                            'Total: ${money(total)}\n\n'
                            'This is a sample screen. No real payment '
                            'will be made.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(dialogContext),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: bold ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
