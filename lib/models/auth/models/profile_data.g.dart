// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return ProfileData()
    ..id = json['_id'] as String?
    ..email = json['email'] as String?
    ..v = json['__v'] as int?
    ..address = json['address'] as String?
    ..createdAt = json['created_at'] as String?
    ..image = json['image'] as String?
    ..latitude = (json['latitude'] as num?)?.toDouble()
    ..longitude = (json['longitude'] as num?)?.toDouble()
    ..updatedAt = json['updated_at'] as String?
    ..phone = json['phone'] as String?;
}

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      '__v': instance.v,
      'address': instance.address,
      'created_at': instance.createdAt,
      'image': instance.image,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'updated_at': instance.updatedAt,
      'phone': instance.phone,
    };
