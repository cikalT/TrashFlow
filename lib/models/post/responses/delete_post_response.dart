import 'package:json_annotation/json_annotation.dart';
import '../models/post_data.dart';

part 'delete_post_response.g.dart';

@JsonSerializable()
class DeletePostResponse {
      DeletePostResponse();

  bool? success;
  PostData? data;
  dynamic message;

  factory DeletePostResponse.fromJson(Map<String,dynamic> json) => _$DeletePostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeletePostResponseToJson(this);
}
