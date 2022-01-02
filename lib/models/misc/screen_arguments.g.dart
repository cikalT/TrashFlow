// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenArguments _$ScreenArgumentsFromJson(Map<String, dynamic> json) {
  return ScreenArguments()
    ..id = json['id'] as String?
    ..title = json['title'] as String?
    ..description = json['description'] as String?
    ..name = json['name'] as String?
    ..data = json['data']
    ..dynamicMap = json['dynamic_map'] as Map<String, dynamic>?
    ..stringMap = (json['string_map'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..intMap = (json['int_map'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as int),
    )
    ..doubleMap = (json['double_map'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, (e as num).toDouble()),
    )
    ..boolMap = (json['bool_map'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as bool),
    )
    ..isEdit = json['is_edit'] as bool?
    ..state = json['state'] as bool?
    ..additionalId = json['additional_id'] as String?
    ..intData = json['int_data'] as int?
    ..doubleData = (json['double_data'] as num?)?.toDouble();
}

Map<String, dynamic> _$ScreenArgumentsToJson(ScreenArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'name': instance.name,
      'data': instance.data,
      'dynamic_map': instance.dynamicMap,
      'string_map': instance.stringMap,
      'int_map': instance.intMap,
      'double_map': instance.doubleMap,
      'bool_map': instance.boolMap,
      'is_edit': instance.isEdit,
      'state': instance.state,
      'additional_id': instance.additionalId,
      'int_data': instance.intData,
      'double_data': instance.doubleData,
    };
