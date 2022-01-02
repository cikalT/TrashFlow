import 'package:json_annotation/json_annotation.dart';


part 'screen_arguments.g.dart';

@JsonSerializable()
class ScreenArguments {
      ScreenArguments();

  String? id;
  String? title;
  String? description;
  String? name;
  @JsonKey() dynamic data;
  @JsonKey(name: 'dynamic_map') Map<String,dynamic>? dynamicMap;
  @JsonKey(name: 'string_map') Map<String,String>? stringMap;
  @JsonKey(name: 'int_map') Map<String,int>? intMap;
  @JsonKey(name: 'double_map') Map<String,double>? doubleMap;
  @JsonKey(name: 'bool_map') Map<String,bool>? boolMap;
  @JsonKey(name: 'is_edit') bool? isEdit;
  bool? state;
  @JsonKey(name: 'additional_id') String? additionalId;
  @JsonKey(name: 'int_data') int? intData;
  @JsonKey(name: 'double_data') double? doubleData;

  factory ScreenArguments.fromJson(Map<String,dynamic> json) => _$ScreenArgumentsFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenArgumentsToJson(this);
}
