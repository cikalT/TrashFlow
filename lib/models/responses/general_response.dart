import 'package:json_annotation/json_annotation.dart';


part 'general_response.g.dart';

@JsonSerializable()
class GeneralResponse {
      GeneralResponse();

  int? status;
  List<dynamic>? meta;
  List<dynamic>? messages;

  factory GeneralResponse.fromJson(Map<String,dynamic> json) => _$GeneralResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}
