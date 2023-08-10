import 'package:github_explorer/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pull.g.dart';

@JsonSerializable()
class Pull {
  Pull({
    required this.id,
    required this.number,
    required this.title,
    required this.createdAt,
    required this.user,
  });

  int id;
  int number;
  String title;
  User user;

  @JsonKey(name: 'created_at')
  String createdAt;

  factory Pull.fromJson(Map<String, dynamic> json) => _$PullFromJson(json);
  Map<String, dynamic> toJson() => _$PullToJson(this);
}
