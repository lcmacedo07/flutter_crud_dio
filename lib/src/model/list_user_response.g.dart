// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProfileResponse _$ListProfileResponseFromJson(Map<String, dynamic> json) {
  return ListProfileResponse()
    ..page = json['current_page'] as int
    ..perPage = json['per_page'] as int
    ..total = json['total'] as int
    // ..totalPages = json['total_pages'] as int
    ..profiles = (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Profile.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ListProfileResponseToJson(ListProfileResponse instance) =>
    <String, dynamic>{
      'current_page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      // 'total_pages': instance.totalPages,
      'data': instance.profiles,
    };
