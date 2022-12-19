import 'package:json_annotation/json_annotation.dart';

part 'json_basedata_objs.g.dart';
//if need regenerate json searializer:
//flutter pub run build_runner watch --delete-conflicting-outputs


@JsonSerializable()
class  Schools{
  final String  name;
  final String  date;
  final String  thesis;
  final String  brief;
  final String? commit;

  @JsonKey( name:"general_subjects" )    final String  generalSubjects;
  @JsonKey( name:"vocational_subjects" ) final String  vocationalSubjects;

  Schools(this.name, this.date, this.generalSubjects, this.vocationalSubjects, this.thesis, this.brief, this.commit);
  dynamic toJson() => _$SchoolsToJson(this);
  factory Schools.fromJson(dynamic json) => _$SchoolsFromJson(json);
}

@JsonSerializable()
class Trainings{
  final String name;

  Trainings(this.name);

  dynamic tojson() => _$TrainingsToJson(this);
  factory Trainings.fromJson(dynamic json) => _$TrainingsFromJson(json);
  
}

@JsonSerializable()
class BaseDataConverter{
  final String          name;
  final String?         image;
  final String          address1;
  final String          address2;
  final String          birth;
  final String          mobile;
  final String          mail;
  final List<Schools>   schools;
  final List<Trainings> trainings;
  final String          languages;

  BaseDataConverter(this.name, this.image, this.address1, this.address2, this.birth, this.mobile, this.mail, this.schools, this.trainings, this.languages);
  dynamic toJson() => _$BaseDataConverterToJson(this);
  factory BaseDataConverter.fromJson(dynamic json) => _$BaseDataConverterFromJson(json);
  
}
