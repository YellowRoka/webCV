// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_jobs_objs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobData _$JobDataFromJson(Map<String, dynamic> json) => JobData(
      json['company'] as String,
      json['position'] as String,
      json['image'] as String?,
      json['place'] as String,
      json['date'] as String,
      json['tasks'] as String,
      json['experinces'] as String,
      json['languages'] as String,
      json['commit'] as String?,
    );

Map<String, dynamic> _$JobDataToJson(JobData instance) => <String, dynamic>{
      'company': instance.company,
      'position': instance.position,
      'image': instance.image,
      'place': instance.place,
      'date': instance.date,
      'tasks': instance.tasks,
      'experinces': instance.experinces,
      'languages': instance.languages,
      'commit': instance.commit,
    };

JobConverter _$JobConverterFromJson(Map<String, dynamic> json) => JobConverter(
      (json['jobs'] as List<dynamic>).map((e) => JobData.fromJson(e)).toList(),
    );

Map<String, dynamic> _$JobConverterToJson(JobConverter instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
    };
