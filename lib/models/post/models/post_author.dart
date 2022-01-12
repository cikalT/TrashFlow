import 'package:json_annotation/json_annotation.dart';


part 'post_author.g.dart';

@JsonSerializable()
class PostAuthor {
      PostAuthor();

  String? name;
  @JsonKey(name: '_id') String? id;
  String? email;
  @JsonKey(name: '__v') int? v;
  String? address;
  @JsonKey(name: 'created_at') String? createdAt;
  String? image;
  int? latitude;
  int? longitude;
  @JsonKey(name: 'updated_at') String? updatedAt;
  String? phone;

  factory PostAuthor.fromJson(Map<String,dynamic> json) => _$PostAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$PostAuthorToJson(this);
}
