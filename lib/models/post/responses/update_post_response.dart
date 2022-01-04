import 'package:json_annotation/json_annotation.dart';
import '../models/post_data.dart';

part 'update_post_response.g.dart';

@JsonSerializable()
class UpdatePostResponse {
      UpdatePostResponse();

  bool? success;
  PostData? data;
  dynamic message;

  factory UpdatePostResponse.fromJson(Map<String,dynamic> json) => _$UpdatePostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePostResponseToJson(this);
}
