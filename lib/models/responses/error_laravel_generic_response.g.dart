// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_laravel_generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorLaravelGenericResponse _$ErrorLaravelGenericResponseFromJson(
    Map<String, dynamic> json) {
  return ErrorLaravelGenericResponse()
    ..status = json['status'] as int?
    ..data = json['data'] == null
        ? null
        : ErrorGenericData.fromJson(json['data'] as Map<String, dynamic>)
    ..meta = json['meta'] as List<dynamic>?
    ..messages = json['messages'] as List<dynamic>?;
}

Map<String, dynamic> _$ErrorLaravelGenericResponseToJson(
        ErrorLaravelGenericResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'meta': instance.meta,
      'messages': instance.messages,
    };
