import 'package:json_annotation/json_annotation.dart';


part 'error_generic_data.g.dart';

@JsonSerializable()
class ErrorGenericData {
      ErrorGenericData();

  String? errors;

  factory ErrorGenericData.fromJson(Map<String,dynamic> json) => _$ErrorGenericDataFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorGenericDataToJson(this);
}
