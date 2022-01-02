import 'package:json_annotation/json_annotation.dart';
import '../misc/error_data.dart';

part 'error_laravel_response.g.dart';

@JsonSerializable()
class ErrorLaravelResponse {
      ErrorLaravelResponse();

  int? status;
  ErrorData? data;
  List<dynamic>? meta;
  List<dynamic>? messages;

  factory ErrorLaravelResponse.fromJson(Map<String,dynamic> json) => _$ErrorLaravelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorLaravelResponseToJson(this);
}
