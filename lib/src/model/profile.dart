import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  int id;
  String name;
  String lastname;
  int age;
  String birthdate;
  String salarary;
  String description;

  Profile({this.id, this.name, this.lastname, this.birthdate, this.salarary, this.description, this.age});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], name: map["name"], lastname: map["lastname"], birthdate: map["birthdate"], salarary: map["salarary"], 
        description: map["description"], age: map["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "lastname": lastname, "birthdate": birthdate, "salarary": salarary, "description": description, "age": age};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, lastname: $lastname, birthdate: $birthdate, salarary: $salarary, description: $description, age: $age}';
  }

}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
