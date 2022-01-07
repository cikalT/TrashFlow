import 'package:json_annotation/json_annotation.dart';
import '../models/faq_data.dart';

part 'get_fqa_list_response.g.dart';

@JsonSerializable()
class GetFqaListResponse {
      GetFqaListResponse();

  bool? success;
  List<FaqData?>? data;
  dynamic message;

  factory GetFqaListResponse.fromJson(Map<String,dynamic> json) => _$GetFqaListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetFqaListResponseToJson(this);
}
