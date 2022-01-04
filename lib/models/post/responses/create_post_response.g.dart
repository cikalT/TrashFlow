// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostResponse _$CreatePostResponseFromJson(Map<String, dynamic> json) {
  return CreatePostResponse()
    ..success = json['success'] as bool?
    ..data = json['data'] == null
        ? null
        : PostData.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'];
}

Map<String, dynamic> _$CreatePostResponseToJson(CreatePostResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
