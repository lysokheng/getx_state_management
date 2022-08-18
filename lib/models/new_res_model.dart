class NewsResModel {
  String? status;
  int? totalResults;
  List<Results>? results;
  int? nextPage;

  NewsResModel({this.status, this.totalResults, this.results, this.nextPage});

  NewsResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = this.nextPage;
    return data;
  }
}

class Results {
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  Null? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  List<String>? country;
  List<String>? category;
  String? language;

  Results(
      {this.title,
        this.link,
        this.keywords,
        this.creator,
        this.videoUrl,
        this.description,
        this.content,
        this.pubDate,
        this.imageUrl,
        this.sourceId,
        this.country,
        this.category,
        this.language});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    // keywords = json['keywords'].cast<String>();
    // creator = json['creator'].cast<String>();
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    country = json['country'].cast<String>();
    category = json['category'].cast<String>();
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    // data['keywords'] = this.keywords;
    // data['creator'] = this.creator;
    data['video_url'] = this.videoUrl;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['country'] = this.country;
    data['category'] = this.category;
    data['language'] = this.language;
    return data;
  }
}
