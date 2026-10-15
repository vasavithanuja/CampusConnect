enum NotificationPriority { urgent, important, normal }

enum NotificationStatus { unread, read, actionRequired, completed }

class CampusNotification {
  final String id;
  final String title;
  final String message;
  final String category;
  final String date;
  final String time;
  final NotificationPriority priority;
  NotificationStatus status;
  final String targetRole;

  CampusNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.category,
    required this.date,
    required this.time,
    required this.priority,
    required this.status,
    required this.targetRole,
  });

  bool get isUrgent => priority == NotificationPriority.urgent;

  bool get isUnread => status == NotificationStatus.unread;

  bool get requiresAction => status == NotificationStatus.actionRequired;
}
