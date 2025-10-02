class MenuItemModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final bool isRecommended;
  final bool isBestSeller;
  final double? discount;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isRecommended = false,
    this.isBestSeller = false,
    this.discount,
  });

  double get finalPrice {
    if (discount != null) {
      return price - (price * discount! / 100);
    }
    return price;
  }
}