import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  Pagination({
    required this.items,
    required this.totalCount,
  });

  List<dynamic> items;

  @JsonKey(name: 'total_count')
  int totalCount;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
