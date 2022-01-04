import 'package:json_annotation/json_annotation.dart';


part 'profile_google.g.dart';

@JsonSerializable()
class ProfileGoogle {
      ProfileGoogle();

  String? email;
  @JsonKey(name: 'display_name') String? displayName;
  @JsonKey(name: 'photo_url') String? photoUrl;
  @JsonKey(name: 'refresh_token') String? refreshToken;
  @JsonKey(name: 'tenant_uuid') String? tenantUuid;
  String? uid;

  factory ProfileGoogle.fromJson(Map<String,dynamic> json) => _$ProfileGoogleFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileGoogleToJson(this);
}
