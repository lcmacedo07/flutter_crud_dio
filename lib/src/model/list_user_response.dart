import 'package:flutter_crud/src/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class ListProfileResponse {
  ListProfileResponse();

  @JsonKey(name: "current_page")
  int page;

  @JsonKey(name: "per_page")
  int perPage;

  @JsonKey(name: "total")
  int total;

  // @JsonKey(name : "total_pages")
  // int totalPages;

  @JsonKey(name: "data")
  List<Profile> profiles;

  factory ListProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListProfileResponseToJson(this);
}
