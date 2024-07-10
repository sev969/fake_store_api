class ShoppingCartModel {
  final int id;
  final String title;
  final String imgUrl;
  final double price;
  int? quantity;

  ShoppingCartModel(
      {required this.id,
      required this.title,
      required this.imgUrl,
      required this.price,
      this.quantity = 1});
}
