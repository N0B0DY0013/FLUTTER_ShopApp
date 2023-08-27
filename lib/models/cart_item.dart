class CartItem {
  String id;
  String title;
  double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 0,
  });
}
