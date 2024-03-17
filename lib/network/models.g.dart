// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      json['id'] as String?,
      json['name'] as String,
    );

Map<String, dynamic> _$SourceToJson(Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  return val;
}

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      Source.fromJson(json['source'] as Map<String, dynamic>),
      json['author'] as String?,
      json['title'] as String,
      json['description'] as String?,
      json['url'] as String?,
      json['urlToImage'] as String?,
      json['publishedAt'] as String?,
      json['content'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      json['status'] as String,
      json['totalResults'] as int?,
      (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles?.map((e) => e.toJson()).toList(),
      'message': instance.message,
    };
