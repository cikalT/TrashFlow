import 'package:json_annotation/json_annotation.dart';
import 'errors.dart';

part 'result_api.g.dart';

@JsonSerializable()
class ResultApi {
      ResultApi();

  @JsonKey(ignore: true) int? total;
  @JsonKey(ignore: true) dynamic data;
  @JsonKey(ignore: true, name: 'list_data') List<dynamic>? listData;
  @JsonKey(defaultValue: false) bool? status;
  String? message;
  @JsonKey(defaultValue: 0, name: 'status_code') int? statusCode;
  Errors? errors;

  factory ResultApi.fromJson(Map<String,dynamic> json) => _$ResultApiFromJson(json);
  Map<String, dynamic> toJson() => _$ResultApiToJson(this);
}
