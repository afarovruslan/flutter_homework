import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Source {
  Source(this.id, this.name);

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class Article {

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

}

@JsonSerializable()
class ApiSuccessfulResponse {
  String status;
  int totalResults;
  List<Article> articles;


}

@JsonSerializable()
class ApiErrorResponse {
  String status;
  String code;
  String message;
}