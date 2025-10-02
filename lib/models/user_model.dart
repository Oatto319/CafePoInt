class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? address;
  final int points;
  final List<String> favoritesMenuIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.address,
    this.points = 0,
    this.favoritesMenuIds = const [],
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? profileImage,
    String? address,
    int? points,
    List<String>? favoritesMenuIds,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      points: points ?? this.points,
      favoritesMenuIds: favoritesMenuIds ?? this.favoritesMenuIds,
    );
  }
}