import 'package:json_annotation/json_annotation.dart';
import 'errors.dart';

part 'error_data.g.dart';

@JsonSerializable()
class ErrorData {
      ErrorData();

  Errors? errors;

  factory ErrorData.fromJson(Map<String,dynamic> json) => _$ErrorDataFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
