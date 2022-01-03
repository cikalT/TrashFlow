import 'package:json_annotation/json_annotation.dart';
import '../models/post_data.dart';

part 'get_post_detail_response.g.dart';

@JsonSerializable()
class GetPostDetailResponse {
      GetPostDetailResponse();

  bool? success;
  PostData? data;
  dynamic message;

  factory GetPostDetailResponse.fromJson(Map<String,dynamic> json) => _$GetPostDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPostDetailResponseToJson(this);
}
