import 'package:json_annotation/json_annotation.dart';
import '../models/post_data.dart';

part 'get_user_post_list_response.g.dart';

@JsonSerializable()
class GetUserPostListResponse {
      GetUserPostListResponse();

  bool? success;
  List<PostData?>? data;
  dynamic message;

  factory GetUserPostListResponse.fromJson(Map<String,dynamic> json) => _$GetUserPostListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserPostListResponseToJson(this);
}
