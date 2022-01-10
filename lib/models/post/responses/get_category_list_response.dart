import 'package:json_annotation/json_annotation.dart';
import '../models/category_data.dart';

part 'get_category_list_response.g.dart';

@JsonSerializable()
class GetCategoryListResponse {
      GetCategoryListResponse();

  bool? success;
  List<CategoryData?>? data;
  dynamic message;

  factory GetCategoryListResponse.fromJson(Map<String,dynamic> json) => _$GetCategoryListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCategoryListResponseToJson(this);
}
