// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) {
  return ErrorData()
    ..errors = json['errors'] == null
        ? null
        : Errors.fromJson(json['errors'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ErrorDataToJson(ErrorData instance) => <String, dynamic>{
      'errors': instance.errors,
    };
