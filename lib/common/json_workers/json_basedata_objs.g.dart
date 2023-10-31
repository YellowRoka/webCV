// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_basedata_objs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schools _$SchoolsFromJson(Map<String, dynamic> json) => Schools(
      json['name'] as String,
      json['date'] as String,
      json['general_subjects'] as String,
      json['vocational_subjects'] as String,
      json['thesis'] as String,
      json['brief'] as String,
      json['commit'] as String?,
    );

Map<String, dynamic> _$SchoolsToJson(Schools instance) => <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'thesis': instance.thesis,
      'brief': instance.brief,
      'commit': instance.commit,
      'general_subjects': instance.generalSubjects,
      'vocational_subjects': instance.vocationalSubjects,
    };

Trainings _$TrainingsFromJson(Map<String, dynamic> json) => Trainings(
      json['name'] as String,
    );

Map<String, dynamic> _$TrainingsToJson(Trainings instance) => <String, dynamic>{
      'name': instance.name,
    };

BaseDataConverter _$BaseDataConverterFromJson(Map<String, dynamic> json) =>
    BaseDataConverter(
      json['name'] as String,
      json['image'] as String?,
      json['address1'] as String,
      json['address2'] as String,
      json['birth'] as String,
      json['mobile'] as String,
      json['mail'] as String,
      (json['schools'] as List<dynamic>).map(Schools.fromJson).toList(),
      (json['trainings'] as List<dynamic>).map(Trainings.fromJson).toList(),
      json['languages'] as String,
    );

Map<String, dynamic> _$BaseDataConverterToJson(BaseDataConverter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'address1': instance.address1,
      'address2': instance.address2,
      'birth': instance.birth,
      'mobile': instance.mobile,
      'mail': instance.mail,
      'schools': instance.schools,
      'trainings': instance.trainings,
      'languages': instance.languages,
    };
