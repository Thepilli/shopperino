/// A product along with a quantity that can be added to an order/cart
class Item {
  const Item({
    required this.foodId,
    required this.quantity,
  });
  final String foodId;
  final int quantity;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.foodId == foodId && other.quantity == quantity;
  }

  @override
  int get hashCode => foodId.hashCode ^ quantity.hashCode;
}
