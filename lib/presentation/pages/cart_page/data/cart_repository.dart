import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/cart.dart';
import 'package:shopperino/shared/util/in_memory_store.dart';

part 'cart_repository.g.dart';

/// API for reading, watching and writing local cart data (guest user)
class CartRepository {
  final _cart = InMemoryStore<Cart>(const Cart());

  Future<Cart> fetchCart() => Future.value(_cart.value);

  Stream<Cart> watchCart() => _cart.stream;

  Future<void> setCart(Cart cart) async {
    _cart.value = cart;
  }
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  // * Override this in the main method
  throw UnimplementedError();
}
