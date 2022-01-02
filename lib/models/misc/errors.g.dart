// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Errors _$ErrorsFromJson(Map<String, dynamic> json) {
  return Errors()
    ..email = json['email']
    ..password = json['password']
    ..passwordConfirmation = json['password_confirmation']
    ..recaptcha = json['recaptcha']
    ..name = json['name']
    ..waNumber = json['wa_number']
    ..acceptTermCondition = json['accept_term_condition']
    ..refCode = json['ref_code'] as String?
    ..currentPassword = json['current_password']
    ..newPassword = json['new_password']
    ..newPasswordConfirmation = json['new_password_confirmation']
    ..time = json['time']
    ..code = json['code']
    ..notAllowed = json['not_allowed']
    ..promoCode = json['promo_code']
    ..data = json['data']
    ..noWa = json['no_wa']
    ..full = json['full']
    ..otpNotMatch = json['otp_not_match']
    ..otpFalse = json['otp_false']
    ..phone = json['phone']
    ..username = json['username'];
}

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'recaptcha': instance.recaptcha,
      'name': instance.name,
      'wa_number': instance.waNumber,
      'accept_term_condition': instance.acceptTermCondition,
      'ref_code': instance.refCode,
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
      'new_password_confirmation': instance.newPasswordConfirmation,
      'time': instance.time,
      'code': instance.code,
      'not_allowed': instance.notAllowed,
      'promo_code': instance.promoCode,
      'data': instance.data,
      'no_wa': instance.noWa,
      'full': instance.full,
      'otp_not_match': instance.otpNotMatch,
      'otp_false': instance.otpFalse,
      'phone': instance.phone,
      'username': instance.username,
    };
