import 'package:shopperino/presentation/pages/cart_page/domain/cart.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/item.dart';

/// Helper extension used to mutate the items in the shopping cart.
extension MutableCart on Cart {
  /// add an item to the cart by *overriding* the quantity if it already exists
  Cart setItem(Item item) {
    print('called setItem in MUTABLE');

    final copy = Map<String, int>.from(items);
    copy[item.foodId] = item.quantity;
    return Cart(copy);
  }

  /// add an item to the cart by *updating* the quantity if it already exists
  Cart addItem(Item item) {
    print('called addItem in MUTABLE');

    final copy = Map<String, int>.from(items);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy.update(
      item.foodId,
      // if there is already a value, update it by adding the item quantity
      (value) => item.quantity + value,
      // otherwise, add the item with the given quantity
      ifAbsent: () => item.quantity,
    );
    return Cart(copy);
  }

  /// add a list of items to the cart by *updating* the quantities of items that
  /// already exist
  Cart addItems(List<Item> itemsToAdd) {
    print('called addItems in MUTABLE');

    final copy = Map<String, int>.from(items);
    for (var item in itemsToAdd) {
      copy.update(
        item.foodId,
        // if there is already a value, update it by adding the item quantity
        (value) => item.quantity + value,
        // otherwise, add the item with the given quantity
        ifAbsent: () => item.quantity,
      );
    }
    return Cart(copy);
  }

  /// if an item with the given foodId is found, remove it
  Cart removeItemById(String foodId) {
    print('called removeItemById in MUTABLE');

    final copy = Map<String, int>.from(items);
    copy.remove(foodId);
    return Cart(copy);
  }
}
