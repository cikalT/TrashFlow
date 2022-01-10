// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_post_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserPostListResponse _$GetUserPostListResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserPostListResponse()
    ..success = json['success'] as bool?
    ..data = (json['data'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : PostData.fromJson(e as Map<String, dynamic>))
        .toList()
    ..message = json['message'];
}

Map<String, dynamic> _$GetUserPostListResponseToJson(
        GetUserPostListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
