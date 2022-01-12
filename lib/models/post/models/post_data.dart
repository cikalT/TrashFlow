import 'package:json_annotation/json_annotation.dart';
import 'post_author.dart';
import 'category_data.dart';

part 'post_data.g.dart';

@JsonSerializable()
class PostData {
      PostData();

  @JsonKey(name: '_id') String? id;
  @JsonKey(name: '__v') int? v;
  @JsonKey(name: 'category_ids') List<dynamic>? categoryIds;
  @JsonKey(name: 'created_at') String? createdAt;
  String? description;
  String? image;
  int? price;
  String? title;
  String? type;
  @JsonKey(name: 'updated_at') String? updatedAt;
  @JsonKey(name: 'user_id') String? userId;
  PostAuthor? author;
  List<CategoryData?>? categories;

  factory PostData.fromJson(Map<String,dynamic> json) => _$PostDataFromJson(json);
  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
