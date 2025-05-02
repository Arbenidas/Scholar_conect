class Scholarship {
  final String id;
  final String title;
  final int amount;
  final DateTime deadline;
  final String imageUrl;
  final bool isSaved;
  final String organization;
  final String description;
  final List<String> eligibilityRequirements;
  final List<String> applicationMaterials;
  final Map<String, int> selectionCriteria;

  Scholarship({
    this.id = '',
    required this.title,
    required this.amount,
    required this.deadline,
    required this.imageUrl,
    this.isSaved = false,
    this.organization = '',
    this.description = '',
    this.eligibilityRequirements = const [],
    this.applicationMaterials = const [],
    this.selectionCriteria = const {},
  });
}
