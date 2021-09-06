
enum NewsType {
  text,
  singleImg,
  multipleImg,
  special,
  video,
  videoList,
}

class NewsModel {
  String? _tid;
  String? _docid;
  String? _title;
  /// 来源
  String? _source;
  int? _replyCount;
  String? _ptime;
  String? _imgsrc;
  bool? _showFollow;
  List<TagList>? _tagList;

  /// 显示类型
  NewsType get type {
    if(_imgsrc != null){
      return NewsType.singleImg;
    }

    return NewsType.text;
  }
  String? get tid => _tid;
  String? get docid => _docid;
  String? get title => _title;
  String? get source => _source;
  String get replyCountStr {
    if(_replyCount == 0 || _replyCount == null){
      return "";
    }
    if(_replyCount! <= 9999){
      return "$_replyCount跟帖";
    } else {
      double _count = _replyCount! / 10000.0;
      return _count.toStringAsFixed(1) + "万跟帖";
    }
  }
  String? get ptime => _ptime;
  String? get imgsrc => _imgsrc;
  bool? get showFollow => _showFollow;
  List<TagList>? get tagList => _tagList;

  NewsModel({
    String? tid,
    String? docid,
    String? title,
    int? replyCount,
    String? source,
    String? ptime,
    String? replyid,
    String? imgsrc,
    List<TagList>? tagList,
    bool? showFollow}){
    _docid = docid;
    _title = title;
    _replyCount = replyCount;
    _source = source;
    _tid = tid;
    _ptime = ptime;
    _showFollow = showFollow;
    _imgsrc = imgsrc;
    _tagList = tagList;
  }

  NewsModel.fromJson(dynamic json) {
    _docid = json['docid'];
    _title = json['title'];
    _replyCount = json['replyCount'];
    _source = json['source'];
    _tid = json['tid'];
    _ptime = json['ptime'];
    _imgsrc = json["imgsrc"];
    if (json['tagList'] != null) {
      _tagList = [];
      json['tagList'].forEach((v) {
        _tagList?.add(TagList.fromJson(v));
      });
    }
    _showFollow = json['showFollow'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['docid'] = _docid;
    map['title'] = _title;
    map['replyCount'] = _replyCount;
    map['source'] = _source;
    map['tid'] = _tid;
    map['ptime'] = _ptime;
    if (_tagList != null) {
      map['tagList'] = _tagList?.map((v) => v.toJson()).toList();
    }
    map['showFollow'] = _showFollow;
    map["imgsrc"] = _imgsrc;
    return map;
  }

}

class TagList {
  int? _level;
  String? _text;
  String? _type;

  int? get level => _level;
  String? get text => _text;
  String? get type => _type;

  TagList({
    int? level,
    String? text,
    String? type}){
    _level = level;
    _text = text;
    _type = type;
  }

  TagList.fromJson(dynamic json) {
    _level = json['level'];
    _text = json['text'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['level'] = _level;
    map['text'] = _text;
    map['type'] = _type;
    return map;
  }

}