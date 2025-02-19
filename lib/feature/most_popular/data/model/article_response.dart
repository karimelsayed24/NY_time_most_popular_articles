// article_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  final String status;
  final String copyright;
  @JsonKey(name: 'num_results')
  final int numResults;
  final List<Article> results;

  ArticleResponse({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => 
    _$ArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable()
class Article {
  final String uri;
  final String url;
  final int id;
  @JsonKey(name: 'asset_id')
  final int assetId;
  final String source;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  final String updated;
  final String section;
  final String subsection;
  final String nytdsection;
  @JsonKey(name: 'adx_keywords')
  final String adxKeywords;
  final String? column;
  final String byline;
  final String type;
  final String title;
  final String abstract;
  @JsonKey(name: 'des_facet')
  final List<String> desFacet;
  @JsonKey(name: 'org_facet')
  final List<String> orgFacet;
  @JsonKey(name: 'per_facet')
  final List<String> perFacet;
  @JsonKey(name: 'geo_facet')
  final List<String> geoFacet;
  final List<Media> media;
  @JsonKey(name: 'eta_id')
  final int etaId;

  Article({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.abstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
  });

  factory Article.fromJson(Map<String, dynamic> json) => 
    _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Media {
  final String type;
  final String subtype;
  final String caption;
  final String copyright;
  @JsonKey(name: 'approved_for_syndication')
  final int approvedForSyndication;
  @JsonKey(name: 'media-metadata')
  final List<MediaMetadata> mediaMetadata;

  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => 
    _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class MediaMetadata {
  final String url;
  final String format;
  final int height;
  final int width;

  MediaMetadata({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  factory MediaMetadata.fromJson(Map<String, dynamic> json) => 
    _$MediaMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MediaMetadataToJson(this);
}