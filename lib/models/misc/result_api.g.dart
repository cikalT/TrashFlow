// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultApi _$ResultApiFromJson(Map<String, dynamic> json) {
  return ResultApi()
    ..status = json['status'] as bool? ?? false
    ..message = json['message'] as String?
    ..statusCode = json['status_code'] as int? ?? 0
    ..errors = json['errors'] == null
        ? null
        : Errors.fromJson(json['errors'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResultApiToJson(ResultApi instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.statusCode,
      'errors': instance.errors,
    };
