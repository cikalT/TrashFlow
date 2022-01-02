import 'package:json_annotation/json_annotation.dart';


part 'filter.g.dart';

@JsonSerializable()
class Filter {
      Filter();

  @JsonKey(defaultValue: false) bool? selected;
  dynamic value;
  String? label;
  int? index;
  @JsonKey(name: 'sub_label') String? subLabel;
  @JsonKey(name: 'box_color') String? boxColor;
  dynamic data;

  factory Filter.fromJson(Map<String,dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}
