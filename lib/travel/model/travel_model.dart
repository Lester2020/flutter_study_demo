class TravelModel {
  int totalCount;
  List<TravelItem>? resultList;

  TravelModel({
    this.totalCount = 0,
    this.resultList,
  });

  factory TravelModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<TravelItem>? resultList =
    jsonRes['resultList'] is List ? <TravelItem>[] : null;
    if (resultList != null) {
      for (final dynamic item in jsonRes['resultList']!) {
        if (item != null) {
          resultList.add(TravelItem.fromJson(item));
        }
      }
    }
    return TravelModel(
      totalCount: jsonRes['totalCount'],
      resultList: resultList!,
    );
  }
}

class TravelItem {
  int type;
  Article? article;

  TravelItem({
    this.type = 0,
    this.article,
  });

  factory TravelItem.fromJson(Map<String, dynamic> jsonRes) {
    return TravelItem(
      type: jsonRes['type'],
      article:
      Article.fromJson(jsonRes['article']),
    );
  }
}

class Article {
  int articleId;
  int productType;
  int sourceType;
  String? articleTitle;
  Author? author;
  List<Images>? images;
  bool hasVideo;
  int readCount;
  int likeCount;
  int commentCount;
  List<Urls>? urls;
  List<Tags>? tags;
  List<Topics>? topics;
  List<Pois>? pois;
  String? publishTime;
  String? publishTimeDisplay;
  String? shootTime;
  String? shootTimeDisplay;
  int level;
  String? distanceText;
  bool isLike;
  int imageCounts;
  bool isCollected;
  int collectCount;
  int articleStatus;
  String? poiName;

  Article({
    this.articleId = 0,
    this.productType = 0,
    this.sourceType = 0,
    this.articleTitle,
    this.author,
    this.images,
    this.hasVideo = false,
    this.readCount = 0,
    this.likeCount = 0,
    this.commentCount = 0,
    this.urls,
    this.tags,
    this.topics,
    this.pois,
    this.publishTime,
    this.publishTimeDisplay,
    this.shootTime,
    this.shootTimeDisplay,
    this.level = 0,
    this.distanceText,
    this.isLike = false,
    this.imageCounts = 0,
    this.isCollected = false,
    this.collectCount = 0,
    this.articleStatus = 0,
    this.poiName,
  });

  factory Article.fromJson(Map<String, dynamic> jsonRes) {
    final List<Images>? images = jsonRes['images'] is List ? <Images>[] : null;
    if (images != null) {
      for (final dynamic item in jsonRes['images']!) {
        if (item != null) {
          images.add(Images.fromJson(item));
        }
      }
    }

    final List<Urls>? urls = jsonRes['urls'] is List ? <Urls>[] : null;
    if (urls != null) {
      for (final dynamic item in jsonRes['urls']!) {
        if (item != null) {
          urls.add(Urls.fromJson(item));
        }
      }
    }

    final List<Tags>? tags = jsonRes['tags'] is List ? <Tags>[] : null;
    if (tags != null) {
      for (final dynamic item in jsonRes['tags']!) {
        if (item != null) {
          tags.add(Tags.fromJson(item));
        }
      }
    }

    final List<Topics>? topics = jsonRes['topics'] is List ? <Topics>[] : null;
    if (topics != null) {
      for (final dynamic item in jsonRes['topics']!) {
        if (item != null) {
          topics.add(Topics.fromJson(item));
        }
      }
    }

    final List<Pois>? pois = jsonRes['pois'] is List ? <Pois>[] : null;
    if (pois != null) {
      for (final dynamic item in jsonRes['pois']!) {
        if (item != null) {
          pois.add(Pois.fromJson(item));
        }
      }
    }

    return Article(
      articleId: jsonRes['articleId'],
      productType: jsonRes['productType'],
      sourceType: jsonRes['sourceType'],
      articleTitle: jsonRes['articleTitle'],
      author: Author.fromJson(jsonRes['author']),
      images: images!,
      hasVideo: jsonRes['hasVideo'],
      readCount: jsonRes['readCount'],
      likeCount: jsonRes['likeCount'],
      commentCount: jsonRes['commentCount'],
      urls: urls!,
      tags: tags!,
      topics: topics!,
      pois: pois!,
      publishTime: jsonRes['publishTime'],
      publishTimeDisplay: jsonRes['publishTimeDisplay'],
      shootTime: jsonRes['shootTime'],
      shootTimeDisplay: jsonRes['shootTimeDisplay'],
      level: jsonRes['level'],
      distanceText: jsonRes['distanceText'],
      isLike: jsonRes['isLike'],
      imageCounts: jsonRes['imageCounts'],
      isCollected: jsonRes['isCollected'],
      collectCount: jsonRes['collectCount'],
      articleStatus: jsonRes['articleStatus'],
      poiName: jsonRes['poiName'],
    );
  }
}

class Author {
  int authorId;
  String? nickName;
  String? clientAuth;
  String? jumpUrl;
  CoverImage? coverImage;

  Author({
    this.authorId = 0,
    this.nickName,
    this.clientAuth,
    this.jumpUrl,
    this.coverImage,
  });

  factory Author.fromJson(Map<String, dynamic> jsonRes) {
    return Author(
      authorId: jsonRes['authorId'],
      nickName: jsonRes['nickName'],
      clientAuth: jsonRes['clientAuth'],
      jumpUrl: jsonRes['jumpUrl'],
      coverImage: CoverImage.fromJson(jsonRes['coverImage']),
    );
  }
}

class CoverImage {
  String? dynamicUrl;
  String? originalUrl;

  CoverImage({
    this.dynamicUrl,
    this.originalUrl,
  });

  factory CoverImage.fromJson(Map<String, dynamic> jsonRes) {
    return CoverImage(
      dynamicUrl: jsonRes['dynamicUrl'],
      originalUrl: jsonRes['originalUrl'],
    );
  }
}

class Images {
  int imageId;
  String? dynamicUrl;
  String? originalUrl;
  double width;
  double height;
  int mediaType;
  double lat;
  double lon;

  Images({
    this.imageId = 0,
    this.dynamicUrl,
    this.originalUrl,
    this.width = 0,
    this.height = 0,
    this.mediaType = 0,
    this.lat = 0,
    this.lon = 0,
  });

  factory Images.fromJson(Map<String, dynamic> jsonRes) {
    return Images(
      imageId: jsonRes['imageId'],
      dynamicUrl: jsonRes['dynamicUrl'],
      originalUrl: jsonRes['originalUrl'],
      width: jsonRes['width'],
      height: jsonRes['height'],
      mediaType: jsonRes['mediaType'],
      lat: jsonRes['lat'],
      lon: jsonRes['lon'],
    );
  }
}

class Urls {
  String? version;
  String? appUrl;
  String? h5Url;
  String? wxUrl;

  Urls({
    this.version,
    this.appUrl,
    this.h5Url,
    this.wxUrl,
  });

  factory Urls.fromJson(Map<String, dynamic> jsonRes) {
    return Urls(
      version: jsonRes['version'],
      appUrl: jsonRes['appUrl'],
      h5Url: jsonRes['h5Url'],
      wxUrl: jsonRes['wxUrl'],
    );
  }
}

class Tags {
  int tagId;
  String? tagName;
  int tagLevel;
  int parentTagId;
  int source;
  int sortIndex;

  Tags({
    this.tagId = 0,
    this.tagName,
    this.tagLevel = 0,
    this.parentTagId = 0,
    this.source = 0,
    this.sortIndex = 0,
  });

  factory Tags.fromJson(Map<String, dynamic> jsonRes) {
    return Tags(
      tagId: jsonRes['tagId'],
      tagName: jsonRes['tagName'],
      tagLevel: jsonRes['tagLevel'],
      parentTagId: jsonRes['parentTagId'],
      source: jsonRes['source'],
      sortIndex: jsonRes['sortIndex'],
    );
  }
}

class Topics {

  int? topicId;
  String? topicName;
  int? level;

  Topics({
    this.topicId,
    this.topicName,
    this.level,
  });

  factory Topics.fromJson(Map<String, dynamic> jsonRes) {
    return Topics(
      topicId: jsonRes['topicId'],
      topicName: jsonRes['topicName'],
      level: jsonRes['level'],
    );
  }
}

class Pois {
  int? poiType;
  int? poiId;
  String? poiName;
  int? districtId;
  String? districtName;
  PoiExt? poiExt;
  int? source;
  int? isMain;
  bool isInChina;

  Pois({
    this.poiType,
    this.poiId,
    this.poiName,
    this.districtId,
    this.districtName,
    this.poiExt,
    this.source,
    this.isMain,
    this.isInChina = true,
  });

  factory Pois.fromJson(Map<String, dynamic> json) {
    return Pois(
      poiType: json['poiType'],
      poiId: json['poiId'],
      poiName: json['poiName'],
      districtId: json['districtId'],
      districtName: json['districtName'],
      poiExt: PoiExt.fromJson(json['poiExt']),
      source: json['source'],
      isMain: json['isMain'],
      isInChina: json['isInChina'],
    );
  }
}

class PoiExt {
  String? h5Url;
  String? appUrl;

  PoiExt({this.h5Url, this.appUrl});
  factory PoiExt.fromJson(Map<String, dynamic> json) {
    return PoiExt(
        h5Url: json["h5Url"],
        appUrl: json["appUrl"]
    );
  }
}