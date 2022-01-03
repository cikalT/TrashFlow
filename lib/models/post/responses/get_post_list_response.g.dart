// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostListResponse _$GetPostListResponseFromJson(Map<String, dynamic> json) {
  return GetPostListResponse()
    ..success = json['success'] as bool?
    ..data = (json['data'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : PostData.fromJson(e as Map<String, dynamic>))
        .toList()
    ..message = json['message'];
}

Map<String, dynamic> _$GetPostListResponseToJson(
        GetPostListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
