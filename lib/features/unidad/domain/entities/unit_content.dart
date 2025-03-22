// lib/domain/entities/unit_content.dart
class UnitContent {
  final String id;
  final String unitId;
  final String title;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;
  final List<String>? attachments;

  UnitContent({
    required this.id,
    required this.unitId,
    required this.title,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
    this.attachments,
  });
}
