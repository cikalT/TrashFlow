// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqData _$FaqDataFromJson(Map<String, dynamic> json) {
  return FaqData()
    ..id = json['id'] as int?
    ..title = json['title'] as String?
    ..desc = json['desc'] as String?;
}

Map<String, dynamic> _$FaqDataToJson(FaqData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
    };
