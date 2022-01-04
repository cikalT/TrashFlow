// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePostResponse _$DeletePostResponseFromJson(Map<String, dynamic> json) {
  return DeletePostResponse()
    ..success = json['success'] as bool?
    ..data = json['data'] == null
        ? null
        : PostData.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'];
}

Map<String, dynamic> _$DeletePostResponseToJson(DeletePostResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
