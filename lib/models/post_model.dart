class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String? userImage;
  final String imageUrl;
  final String caption;
  final String? menuTag;
  final int likes;
  final List<Comment> comments;
  final DateTime createdAt;
  final bool isLikedByCurrentUser;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userImage,
    required this.imageUrl,
    required this.caption,
    this.menuTag,
    this.likes = 0,
    this.comments = const [],
    required this.createdAt,
    this.isLikedByCurrentUser = false,
  });
}

class Comment {
  final String userId;
  final String userName;
  final String text;
  final DateTime createdAt;

  Comment({
    required this.userId,
    required this.userName,
    required this.text,
    required this.createdAt,
  });
}