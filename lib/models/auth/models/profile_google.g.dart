// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_google.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileGoogle _$ProfileGoogleFromJson(Map<String, dynamic> json) {
  return ProfileGoogle()
    ..email = json['email'] as String?
    ..displayName = json['display_name'] as String?
    ..photoUrl = json['photo_url'] as String?
    ..refreshToken = json['refresh_token'] as String?
    ..tenantUuid = json['tenant_uuid'] as String?
    ..uid = json['uid'] as String?;
}

Map<String, dynamic> _$ProfileGoogleToJson(ProfileGoogle instance) =>
    <String, dynamic>{
      'email': instance.email,
      'display_name': instance.displayName,
      'photo_url': instance.photoUrl,
      'refresh_token': instance.refreshToken,
      'tenant_uuid': instance.tenantUuid,
      'uid': instance.uid,
    };
