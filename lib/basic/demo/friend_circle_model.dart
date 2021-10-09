class FriendCircleModel {
  /// 用户名
  final String userName;
  /// 用户头像
  final String userImgUrl;
  /// 说说
  final String saying;
  /// 图片
  final String pic;
  /// 发布时间
  final String publishTime;
  /// 评论内容
  final List<Comment> comments;

  FriendCircleModel({
      required this.userName,
      required this.userImgUrl,
      required this.saying,
      required this.pic,
      required this.publishTime,
      required this.comments});

}

class Comment {
  /// 是否是发起人
  final bool source;
  /// 评论者
  final String fromUser;
  /// 被评论者
  final String toUser;
  /// 评论内容
  final String content;

  Comment({
    required this.source,
    required this.fromUser,
    required this.toUser,
    required this.content
  });

}