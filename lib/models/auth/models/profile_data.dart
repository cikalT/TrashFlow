import 'package:json_annotation/json_annotation.dart';


part 'profile_data.g.dart';

@JsonSerializable()
class ProfileData {
      ProfileData();

  String? name;
  @JsonKey(name: '_id') String? id;
  String? email;
  @JsonKey(name: '__v') int? v;
  String? address;
  @JsonKey(name: 'created_at') String? createdAt;
  String? image;
  double? latitude;
  double? longitude;
  @JsonKey(name: 'updated_at') String? updatedAt;
  String? phone;

  factory ProfileData.fromJson(Map<String,dynamic> json) => _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
