import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopperino/presentation/pages/cart_page/application/cart_service.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/item.dart';

part 'cart_controller.g.dart';

@riverpod
class ShoppingCartScreenController extends _$ShoppingCartScreenController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  CartService get cartService => ref.read(cartServiceProvider);

  Future<void> updateItemQuantity(String foodId, int quantity) async {
    print('called updateItemQuantity in HOMECONTROLLER');

    state = const AsyncLoading();
    final updated = Item(foodId: foodId, quantity: quantity);
    state = await AsyncValue.guard(() => cartService.setItem(updated));
  }

  Future<void> removeItemById(String foodId) async {
    print('called removeItemById in HOMECONTROLLER');

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.removeItemById(foodId));
  }
}
