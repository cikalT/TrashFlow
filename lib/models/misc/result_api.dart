import 'package:json_annotation/json_annotation.dart';


part 'result_api.g.dart';

@JsonSerializable()
class ResultApi {
      ResultApi();

  @JsonKey(ignore: true) dynamic data;
  @JsonKey(ignore: true, name: 'list_data') List<dynamic>? listData;
  @JsonKey(defaultValue: false) bool? success;
  String? message;

  factory ResultApi.fromJson(Map<String,dynamic> json) => _$ResultApiFromJson(json);
  Map<String, dynamic> toJson() => _$ResultApiToJson(this);
}
