import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Source {
  @JsonKey(includeIfNull: false)
  String? id;
  String name;

  Source(this.id, this.name);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String content;

  Article(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  String status;
  int? totalResults;
  List<Article>? articles;
  String? message;

  ApiResponse(this.status, this.totalResults, this.articles, this.message);

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}