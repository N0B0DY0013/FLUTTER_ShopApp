class CartItem {
  String id;
  String title;
  String prodId;
  double price;
  int quantity;

  CartItem({
    required this.id,
    required this.prodId,
    required this.title,
    required this.price,
    this.quantity = 0,
  });
}
