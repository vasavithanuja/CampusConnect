class Club {
  final String id;
  final String name;
  final String category;
  final String description;

  final String coordinator;
  final String meetingPlace;
  final String meetingTime;

  final int members;
  final bool registrationOpen;

  Club({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.coordinator,
    required this.meetingPlace,
    required this.meetingTime,
    required this.members,
    required this.registrationOpen,
  });
}
