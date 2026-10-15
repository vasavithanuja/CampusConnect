import 'package:flutter/material.dart';
import '../models/request.dart';

class RequestStatusChip extends StatelessWidget {
  final RequestStatus status;

  const RequestStatusChip({super.key, required this.status});

  Color _color() {
    switch (status) {
      case RequestStatus.approved:
      case RequestStatus.completed:
        return Colors.green;
      case RequestStatus.rejected:
      case RequestStatus.cancelled:
      case RequestStatus.expired:
        return Colors.red;
      case RequestStatus.inProgress:
        return Colors.blue;
      case RequestStatus.pendingApproval:
        return Colors.orange;
      case RequestStatus.underReview:
        return Colors.deepPurple;
      case RequestStatus.submitted:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color();

    String text;

    switch (status) {
      case RequestStatus.submitted:
        text = 'Submitted';
        break;
      case RequestStatus.underReview:
        text = 'Under Review';
        break;
      case RequestStatus.pendingApproval:
        text = 'Pending Approval';
        break;
      case RequestStatus.approved:
        text = 'Approved';
        break;
      case RequestStatus.rejected:
        text = 'Rejected';
        break;
      case RequestStatus.inProgress:
        text = 'In Progress';
        break;
      case RequestStatus.completed:
        text = 'Completed';
        break;
      case RequestStatus.cancelled:
        text = 'Cancelled';
        break;
      case RequestStatus.expired:
        text = 'Expired';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
