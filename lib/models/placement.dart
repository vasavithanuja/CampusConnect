enum OpportunityType {
  placement,
  internship,
  hackathon,
  competition,
  scholarship,
  certification,
}

class PlacementOpportunity {
  final String id;

  final String company;
  final String role;

  final OpportunityType type;

  final String eligibility;
  final double minimumCgpa;

  final String package;
  final String location;

  final String deadline;
  final String description;

  final bool remote;

  PlacementOpportunity({
    required this.id,
    required this.company,
    required this.role,
    required this.type,
    required this.eligibility,
    required this.minimumCgpa,
    required this.package,
    required this.location,
    required this.deadline,
    required this.description,
    required this.remote,
  });

  bool isEligible({required double cgpa, required int year}) {
    return cgpa >= minimumCgpa;
  }
}
