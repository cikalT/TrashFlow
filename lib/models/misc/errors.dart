import 'package:json_annotation/json_annotation.dart';


part 'errors.g.dart';

@JsonSerializable()
class Errors {
      Errors();

  dynamic email;
  dynamic password;
  @JsonKey(name: 'password_confirmation') dynamic passwordConfirmation;
  dynamic recaptcha;
  dynamic name;
  @JsonKey(name: 'wa_number') dynamic waNumber;
  @JsonKey(name: 'accept_term_condition') dynamic acceptTermCondition;
  @JsonKey(name: 'ref_code') String? refCode;
  @JsonKey(name: 'current_password') dynamic currentPassword;
  @JsonKey(name: 'new_password') dynamic newPassword;
  @JsonKey(name: 'new_password_confirmation') dynamic newPasswordConfirmation;
  dynamic time;
  dynamic code;
  @JsonKey(name: 'not_allowed') dynamic notAllowed;
  @JsonKey(name: 'promo_code') dynamic promoCode;
  dynamic data;
  @JsonKey(name: 'no_wa') dynamic noWa;
  dynamic full;
  @JsonKey(name: 'otp_not_match') dynamic otpNotMatch;
  @JsonKey(name: 'otp_false') dynamic otpFalse;
  dynamic phone;
  dynamic username;

  factory Errors.fromJson(Map<String,dynamic> json) => _$ErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
