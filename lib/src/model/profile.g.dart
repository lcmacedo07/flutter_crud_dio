// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$profileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..lastname = json['lastname'] as String
    ..birthdate = json['birthdate'] as String
    ..age = json['age'] as int
    ..salarary = json['salarary'] as String
    ..description = json['description'] as String;
}

Map<String, dynamic> _$profileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'birthdate': instance.birthdate,
      'age': instance.age,
      'salarary': instance.salarary,
      'description': instance.description,
    };
