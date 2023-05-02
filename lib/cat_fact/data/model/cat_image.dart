import 'package:json_annotation/json_annotation.dart';

part 'cat_image.g.dart';

@JsonSerializable()
class CatImage {
  String url;

  CatImage({
    required this.url,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) => _$CatImageFromJson(json);
  Map<String, dynamic> toJson() => _$CatImageToJson(this);

  @override
  String toString() {
    return 'Cat image: [$url]';
  }
}
