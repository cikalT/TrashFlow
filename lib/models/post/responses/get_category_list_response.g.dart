// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryListResponse _$GetCategoryListResponseFromJson(
    Map<String, dynamic> json) {
  return GetCategoryListResponse()
    ..success = json['success'] as bool?
    ..data = (json['data'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : CategoryData.fromJson(e as Map<String, dynamic>))
        .toList()
    ..message = json['message'];
}

Map<String, dynamic> _$GetCategoryListResponseToJson(
        GetCategoryListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
