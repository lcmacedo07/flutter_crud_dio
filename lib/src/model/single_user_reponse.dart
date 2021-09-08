import 'package:flutter_crud/src/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_user_reponse.g.dart';

@JsonSerializable()
class SingleProfileResponse {
  SingleProfileResponse();

  @JsonKey(name: "data")
  Profile profile;

  factory SingleProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleProfileResponseToJson(this);
}
