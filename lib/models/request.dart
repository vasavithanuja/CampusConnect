enum RequestType {
  temporaryId,
  lostId,
  outing,
  medical,
  complaint,
  maintenance,
  document,
  certificate,
  transport,
  hostel,
  academic,
  exam,
  fee,
  other,
}

enum RequestStatus {
  submitted,
  underReview,
  pendingApproval,
  approved,
  rejected,
  inProgress,
  completed,
  cancelled,
  expired,
}

class CampusRequest {
  final String id;
  final RequestType type;

  final String title;
  final String description;

  final String studentId;
  final String createdDate;
  final String updatedDate;

  RequestStatus status;

  final String currentDepartment;
  final String assignedTo;

  final String? rejectionReason;

  CampusRequest({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.studentId,
    required this.createdDate,
    required this.updatedDate,
    required this.status,
    required this.currentDepartment,
    required this.assignedTo,
    this.rejectionReason,
  });

  String get statusText {
    switch (status) {
      case RequestStatus.submitted:
        return 'Submitted';

      case RequestStatus.underReview:
        return 'Under Review';

      case RequestStatus.pendingApproval:
        return 'Pending Approval';

      case RequestStatus.approved:
        return 'Approved';

      case RequestStatus.rejected:
        return 'Rejected';

      case RequestStatus.inProgress:
        return 'In Progress';

      case RequestStatus.completed:
        return 'Completed';

      case RequestStatus.cancelled:
        return 'Cancelled';

      case RequestStatus.expired:
        return 'Expired';
    }
  }
}
