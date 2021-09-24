import 'package:sprintf/sprintf.dart';

class NewsDetailModel {

  String? _ptime;
  String? _source;
  String? _title;
  String? _body;
  List<ImgNewextra>? _img;
  List<VideoInfo>? _video;

  String? get ptime => _ptime;
  String? get source => _source;
  String? get title => _title;
  String? get body => _body;
  List<ImgNewextra>? get img => _img;
  List<VideoInfo>? get video => _video;

  NewsDetailModel({
    String? ptime,
    String? source,
    String? title,
    String? body,
    List<ImgNewextra>? tagList,
    List<VideoInfo>? video}){
    _ptime = ptime;
    _source = source;
    _title = title;
    _body = body;
    _img = img;
    _video = video;
  }

  NewsDetailModel.fromJson(dynamic json) {
    _ptime = json['ptime'];
    _title = json['title'];
    _source = json['source'];
    _body = json['body'];
    if (json['img'] != null) {
      _img = [];
      json['img'].forEach((v) {
        _img?.add(ImgNewextra.fromJson(v));
      });
    }
    if(json["video"] != null) {
      _video = [];
      json['video'].forEach((v) {
        _video?.add(VideoInfo.fromJson(v));
      });
    }
  }
}

class ImgNewextra {
  String? _src;
  String? _pixel;
  String? _ref;

  String? get src => _src;
  String? get pixel => _pixel;
  String? get ref => _ref;

  ImgNewextra({
    String? src,
    String? ref,
    String? pixel}){
    _src = src;
    _pixel = pixel;
    _ref = ref;
  }

  ImgNewextra.fromJson(dynamic json) {
    _src = json['src'];
    _pixel = json['pixel'];
    _ref = json["ref"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['src'] = _src;
    map['pixel'] = _pixel;
    map["ref"] = _ref;
    return map;
  }
}

class VideoInfo {
  String? _cover;
  String? _alt;
  int? _length;
  String? _mp4_url;
  String? _mp4Hd_url;
  String? _mp4Shd_url;
  String? _m3u8_url;
  String? _m3u8Hd_url;
  String? _ref;
  double? _videoRatio;

  String? get cover => _cover;
  String? get alt => _alt;
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
  String? get ref => _ref;
  double? get videoRatio => _videoRatio;

  VideoInfo({
    String? cover,
    String? alt,
    int? length,
    String? mp4_url,
    String? mp4Hd_url,
    String? mp4Shd_url,
    String? m3u8_url,
    String? m3u8Hd_url,
    double? videoRatio,
    String? ref}){
    _cover = cover;
    _alt = alt;
    _length = length;
    _mp4_url = mp4_url;
    _mp4Hd_url = mp4Hd_url;
    _mp4Shd_url = mp4Shd_url;
    _m3u8_url = m3u8_url;
    _m3u8Hd_url = m3u8Hd_url;
    _videoRatio = videoRatio;
    _ref = ref;
  }

  VideoInfo.fromJson(dynamic json) {
    _cover = json['cover'];
    _alt = json['alt'];
    _length = json["length"];
    _mp4_url = json["mp4_url"];
    _mp4Hd_url = json["mp4Hd_url"];
    _mp4Shd_url = json["mp4Shd_url"];
    _m3u8_url = json["m3u8_url"];
    _m3u8Hd_url = json["m3u8Hd_url"];
    _ref = json["ref"];
    _videoRatio = json["videoRatio"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cover'] = _cover;
    map['alt'] = _alt;
    map['length'] = _length;
    map['mp4_url'] = _mp4_url;
    map['mp4Hd_url'] = _mp4Hd_url;
    map['mp4Shd_url'] = _mp4Shd_url;
    map['m3u8_url'] = _m3u8_url;
    map['m3u8Hd_url'] = _m3u8Hd_url;
    map['ref'] = _ref;
    map["videoRatio"] = _videoRatio;
    return map;
  }

}