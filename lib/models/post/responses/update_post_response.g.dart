// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePostResponse _$UpdatePostResponseFromJson(Map<String, dynamic> json) {
  return UpdatePostResponse()
    ..success = json['success'] as bool?
    ..data = json['data'] == null
        ? null
        : PostData.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'];
}

Map<String, dynamic> _$UpdatePostResponseToJson(UpdatePostResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
