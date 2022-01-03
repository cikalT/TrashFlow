// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostDetailResponse _$GetPostDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetPostDetailResponse()
    ..success = json['success'] as bool?
    ..data = json['data'] == null
        ? null
        : PostData.fromJson(json['data'] as Map<String, dynamic>)
    ..message = json['message'];
}

Map<String, dynamic> _$GetPostDetailResponseToJson(
        GetPostDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
