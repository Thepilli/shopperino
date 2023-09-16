import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/item.dart';

/// Model class representing the shopping cart contents.
class Cart {
  const Cart([this.items = const {}]);

  final Map<String, int> items;

  Map<String, dynamic> toMap() {
    return {
      'items': items,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      Map<String, int>.from(map['items']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart && mapEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        foodId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }
}
