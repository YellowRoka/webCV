import 'package:json_annotation/json_annotation.dart';

part 'json_jobs_objs.g.dart';
//if need regenerate json searializer:
//flutter pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable()
class JobData{
  final String  company;
  final String  position;
  final String? image;
  final String  place;
  final String  date;
  final String  tasks;
  final String  experinces;
  final String  languages;
  final String? commit;

  JobData(this.company, this.position, this.image, this.place, this.date, this.tasks, this.experinces, this.languages, this.commit);
  dynamic toJson() => _$JobDataToJson(this);
  factory JobData.fromJson(dynamic json) => _$JobDataFromJson(json);

}

@JsonSerializable()
class JobConverter{
  final List<JobData> jobs;

  JobConverter(this.jobs);
  dynamic toJson() => _$JobConverterToJson(this);
  factory JobConverter.fromJson(dynamic json) => _$JobConverterFromJson(json);
  
}
