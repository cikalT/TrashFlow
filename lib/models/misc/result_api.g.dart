// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultApi _$ResultApiFromJson(Map<String, dynamic> json) {
  return ResultApi()
    ..success = json['success'] as bool? ?? false
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$ResultApiToJson(ResultApi instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
