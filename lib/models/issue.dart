import 'package:github_explorer/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue.g.dart';

@JsonSerializable()
class Issue {
  Issue({
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

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);
  Map<String, dynamic> toJson() => _$IssueToJson(this);
}
