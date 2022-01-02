// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) {
  return GeneralResponse()
    ..status = json['status'] as int?
    ..meta = json['meta'] as List<dynamic>?
    ..messages = json['messages'] as List<dynamic>?;
}

Map<String, dynamic> _$GeneralResponseToJson(GeneralResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'meta': instance.meta,
      'messages': instance.messages,
    };
