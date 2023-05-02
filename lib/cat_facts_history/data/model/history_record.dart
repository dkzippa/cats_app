import 'package:hive_flutter/hive_flutter.dart';

part 'history_record.g.dart';

@HiveType(typeId: 0)
class HistoryRecord extends HiveObject {
  @HiveField(0)
  String text;
  @HiveField(1)
  String createdAt;

  HistoryRecord({
    required this.text,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Cat history fact: [$createdAt] $text';
  }
}
