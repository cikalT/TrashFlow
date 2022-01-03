import 'package:json_annotation/json_annotation.dart';
import '../models/profile_data.dart';

part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
      GetProfileResponse();

  bool? success;
  ProfileData? data;
  dynamic message;

  factory GetProfileResponse.fromJson(Map<String,dynamic> json) => _$GetProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfileResponseToJson(this);
}
