import 'package:json_annotation/json_annotation.dart';


part 'category_data.g.dart';

@JsonSerializable()
class CategoryData {
      CategoryData();

  @JsonKey(name: '_id') String? id;
  String? name;
  @JsonKey(name: '__v') int? v;
  @JsonKey(name: 'created_at') String? createdAt;
  @JsonKey(name: 'updated_at') String? updatedAt;

  factory CategoryData.fromJson(Map<String,dynamic> json) => _$CategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
