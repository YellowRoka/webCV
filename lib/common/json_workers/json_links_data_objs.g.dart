// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_links_data_objs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksConverter _$LinksConverterFromJson(Map<String, dynamic> json) =>
    LinksConverter(
      (json['media_links'] as List<dynamic>).map((e) => e as String).toList(),
      (json['github_links'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LinksConverterToJson(LinksConverter instance) =>
    <String, dynamic>{
      'media_links': instance.mediaLinks,
      'github_links': instance.githubLinks,
    };
