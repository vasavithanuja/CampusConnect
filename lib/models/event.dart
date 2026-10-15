enum EventType {
  academic,
  placement,
  club,
  cultural,
  sports,
  meeting,
  hostel,
  exam,
  holiday,
  workshop,
  hackathon,
  competition,
  other,
}

class CampusEvent {
  final String id;
  final String title;
  final String description;

  final String date;
  final String startTime;
  final String endTime;

  final String venue;
  final EventType type;

  final String organizer;

  final bool registrationRequired;
  final bool important;

  CampusEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.venue,
    required this.type,
    required this.organizer,
    required this.registrationRequired,
    required this.important,
  });
}
