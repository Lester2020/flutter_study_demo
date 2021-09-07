import 'package:sprintf/sprintf.dart';

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
  List<ImgNewextra>? _imgnewextra;
  VideoInfo? _videoinfo;

  /// 显示类型
  NewsType get type {
    if(_videoinfo != null){
      return NewsType.video;
    }

    if(_imgnewextra != null){
      return NewsType.multipleImg;
    }

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
  List<ImgNewextra>? get imgnewextra => _imgnewextra;
  VideoInfo? get videoinfo => _videoinfo;

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
    List<ImgNewextra>? imgnewextra,
    VideoInfo? videoinfo,
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
    _videoinfo = videoinfo;
    _imgnewextra = imgnewextra;
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
    if(json["imgnewextra"] != null) {
      _imgnewextra = [];
      json['imgnewextra'].forEach((v) {
        _imgnewextra?.add(ImgNewextra.fromJson(v));
      });
    }
    if(json["videoinfo"] != null){
      _videoinfo = VideoInfo.fromJson(json["videoinfo"]);
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
    if(_imgnewextra != null) {
      map['imgnewextra'] = _imgnewextra?.map((e) => e.toJson()).toString();
    }
    map['showFollow'] = _showFollow;
    map["imgsrc"] = _imgsrc;
    map["videoinfo"] = _videoinfo?.toJson().toString();
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

class ImgNewextra {
  String? _imgsrc;
  String? _pixel;

  String? get imgsrc => _imgsrc;
  String? get pixel => _pixel;

  ImgNewextra({
    String? imgsrc,
    String? pixel}){
    _imgsrc = imgsrc;
    _pixel = pixel;
  }

  ImgNewextra.fromJson(dynamic json) {
    _imgsrc = json['imgsrc'];
    _pixel = json['pixel'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['imgsrc'] = _imgsrc;
    map['pixel'] = _pixel;
    return map;
  }
}

class VideoInfo {
  String? _cover;
  String? _title;
  int? _length;
  String? _mp4_url;
  String? _mp4Hd_url;
  String? _mp4Shd_url;
  String? _m3u8_url;
  String? _m3u8Hd_url;
  int? _playCount;
  int? _voteCount;
  int? _autoPlay;

  String? get cover => _cover;
  String? get title => _title;
  String? get length {
    if(_length == null){
      return "00:00";
    }
    int min = (_length ?? 0) ~/ 60;
    int sec = (_length ?? 0) % 60;
    return sprintf("%02i:%02i", [min, sec]);
  }
  String? get mp4_url => _mp4_url;
  String? get mp4Hd_url => _mp4Hd_url;
  String? get mp4Shd_url => _mp4Shd_url;
  String? get m3u8_url => _m3u8_url;
  String? get m3u8Hd_url => _m3u8Hd_url;
  String get playCount {
    if(_playCount == null){
      return "0次播放";
    }
    if((_playCount??0) <= 9999){
      return "${_playCount??0}次播放";
    } else {
      double count = (_playCount??0) / 10000.0;
      return count.toStringAsFixed(1) + "万次播放";
    }
  }
  int? get voteCount => _voteCount;
  int? get autoPlay => _autoPlay;

  VideoInfo({
    String? cover,
    String? title,
    int? length,
    String? mp4_url,
    String? mp4Hd_url,
    String? mp4Shd_url,
    String? m3u8_url,
    String? m3u8Hd_url,
    int? autoPlay}){
    _cover = cover;
    _title = title;
    _length = length;
    _mp4_url = mp4_url;
    _mp4Hd_url = mp4Hd_url;
    _mp4Shd_url = mp4Shd_url;
    _m3u8_url = m3u8_url;
    _m3u8Hd_url = m3u8Hd_url;
    _autoPlay = autoPlay;
  }

  VideoInfo.fromJson(dynamic json) {
    _cover = json['cover'];
    _title = json['title'];
    _length = json["length"];
    _mp4_url = json["mp4_url"];
    _mp4Hd_url = json["mp4Hd_url"];
    _mp4Shd_url = json["mp4Shd_url"];
    _m3u8_url = json["m3u8_url"];
    _m3u8Hd_url = json["m3u8Hd_url"];
    _autoPlay = json["autoPlay"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cover'] = _cover;
    map['title'] = _title;
    map['length'] = _length;
    map['mp4_url'] = _mp4_url;
    map['mp4Hd_url'] = _mp4Hd_url;
    map['mp4Shd_url'] = _mp4Shd_url;
    map['m3u8_url'] = _m3u8_url;
    map['m3u8Hd_url'] = _m3u8Hd_url;
    map['autoPlay'] = _autoPlay;
    return map;
  }

}