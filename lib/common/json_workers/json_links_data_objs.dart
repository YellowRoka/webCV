import 'package:json_annotation/json_annotation.dart';

part 'json_links_data_objs.g.dart';

//if need regenerate json searializer:
//flutter pub run build_runner watch --delete-conflicting-outputs

@JsonSerializable()
class LinksConverter{
  @JsonKey(name: "media_links")  final List<String> mediaLinks;
  @JsonKey(name: "github_links") final List<String> githubLinks;

  LinksConverter( this.mediaLinks, this.githubLinks );
  dynamic toJson() => _$LinksConverterToJson(this);
  factory LinksConverter.fromJson(dynamic json) => _$LinksConverterFromJson(json);
}
