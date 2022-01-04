import 'package:json_annotation/json_annotation.dart';
import '../models/post_data.dart';

part 'create_post_response.g.dart';

@JsonSerializable()
class CreatePostResponse {
      CreatePostResponse();

  bool? success;
  PostData? data;
  dynamic message;

  factory CreatePostResponse.fromJson(Map<String,dynamic> json) => _$CreatePostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreatePostResponseToJson(this);
}
