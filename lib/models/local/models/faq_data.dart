import 'package:json_annotation/json_annotation.dart';


part 'faq_data.g.dart';

@JsonSerializable()
class FaqData {
      FaqData();

  int? id;
  String? title;
  String? desc;

  factory FaqData.fromJson(Map<String,dynamic> json) => _$FaqDataFromJson(json);
  Map<String, dynamic> toJson() => _$FaqDataToJson(this);
}
