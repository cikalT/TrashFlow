// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return Filter()
    ..selected = json['selected'] as bool? ?? false
    ..value = json['value']
    ..label = json['label'] as String?
    ..index = json['index'] as int?
    ..subLabel = json['sub_label'] as String?
    ..boxColor = json['box_color'] as String?
    ..data = json['data'];
}

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'selected': instance.selected,
      'value': instance.value,
      'label': instance.label,
      'index': instance.index,
      'sub_label': instance.subLabel,
      'box_color': instance.boxColor,
      'data': instance.data,
    };
