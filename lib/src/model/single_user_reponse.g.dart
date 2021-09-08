// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_user_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleProfileResponse _$SingleProfileResponseFromJson(Map<String, dynamic> json) {
  return SingleProfileResponse()
    ..profile = json['data'] == null
        ? null
        : Profile.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SingleProfileResponseToJson(SingleProfileResponse instance) =>
    <String, dynamic>{
      'data': instance.profile,
    };
