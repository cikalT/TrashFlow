// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_laravel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorLaravelResponse _$ErrorLaravelResponseFromJson(Map<String, dynamic> json) {
  return ErrorLaravelResponse()
    ..status = json['status'] as int?
    ..data = json['data'] == null
        ? null
        : ErrorData.fromJson(json['data'] as Map<String, dynamic>)
    ..meta = json['meta'] as List<dynamic>?
    ..messages = json['messages'] as List<dynamic>?;
}

Map<String, dynamic> _$ErrorLaravelResponseToJson(
        ErrorLaravelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'meta': instance.meta,
      'messages': instance.messages,
    };
