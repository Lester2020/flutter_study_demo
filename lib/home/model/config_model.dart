class ConfigModel {
  final String searchUrl;

  ConfigModel({required this.searchUrl});

  /// 字典转模型
  factory ConfigModel.fromJson(Map<String, dynamic>json) {
    return ConfigModel(searchUrl: json["searchUrl"]);
  }

  /// 模型转字典
  Map<String, dynamic> toJson() {
    return {searchUrl : searchUrl};
  }

}