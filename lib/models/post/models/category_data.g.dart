// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return CategoryData()
    ..id = json['_id'] as String?
    ..name = json['name'] as String?
    ..v = json['__v'] as int?
    ..createdAt = json['created_at'] as String?
    ..updatedAt = json['updated_at'] as String?;
}

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      '__v': instance.v,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
