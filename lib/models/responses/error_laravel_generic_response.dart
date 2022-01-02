import 'package:json_annotation/json_annotation.dart';
import '../misc/error_generic_data.dart';

part 'error_laravel_generic_response.g.dart';

@JsonSerializable()
class ErrorLaravelGenericResponse {
      ErrorLaravelGenericResponse();

  int? status;
  ErrorGenericData? data;
  List<dynamic>? meta;
  List<dynamic>? messages;

  factory ErrorLaravelGenericResponse.fromJson(Map<String,dynamic> json) => _$ErrorLaravelGenericResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorLaravelGenericResponseToJson(this);
}
