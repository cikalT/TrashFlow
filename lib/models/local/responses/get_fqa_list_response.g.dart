// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fqa_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFqaListResponse _$GetFqaListResponseFromJson(Map<String, dynamic> json) {
  return GetFqaListResponse()
    ..success = json['success'] as bool?
    ..data = (json['data'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : FaqData.fromJson(e as Map<String, dynamic>))
        .toList()
    ..message = json['message'];
}

Map<String, dynamic> _$GetFqaListResponseToJson(GetFqaListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
