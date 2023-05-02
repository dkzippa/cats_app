import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
class CatFact {
  String text;
  String createdAt;

  CatFact({
    required this.text,
    required this.createdAt,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);
  Map<String, dynamic> toJson() => _$CatFactToJson(this);

  @override
  String toString() {
    return 'CatFact: [$createdAt] $text';
  }
}
