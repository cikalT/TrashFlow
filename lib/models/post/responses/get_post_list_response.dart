import 'package:json_annotation/json_annotation.dart';
import '../models/post_data.dart';

part 'get_post_list_response.g.dart';

@JsonSerializable()
class GetPostListResponse {
      GetPostListResponse();

  bool? success;
  List<PostData?>? data;
  dynamic message;

  factory GetPostListResponse.fromJson(Map<String,dynamic> json) => _$GetPostListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPostListResponseToJson(this);
}
