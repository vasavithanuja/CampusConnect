enum AchievementType {
  academic,
  club,
  hackathon,
  competition,
  internship,
  certification,
  volunteering,
  sports,
  cultural,
  project,
  other,
}

class Achievement {
  final String id;
  final String title;
  final String organization;

  final AchievementType type;

  final String date;
  final String description;

  final bool verified;

  Achievement({
    required this.id,
    required this.title,
    required this.organization,
    required this.type,
    required this.date,
    required this.description,
    required this.verified,
  });
}
