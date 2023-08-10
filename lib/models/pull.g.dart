// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pull _$PullFromJson(Map<String, dynamic> json) => Pull(
      id: json['id'] as int,
      number: json['number'] as int,
      title: json['title'] as String,
      createdAt: json['created_at'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PullToJson(Pull instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'title': instance.title,
      'user': instance.user,
      'created_at': instance.createdAt,
    };
