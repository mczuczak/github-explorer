import 'package:github_explorer/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.language,
    required this.updatedAt,
    required this.owner,
  });

  int id;
  String name;
  String? description;
  String? language;
  User owner;

  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
