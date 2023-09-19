import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/cart.dart';

part 'cart_repository.g.dart';

/// API for reading, watching and writing local cart data (guest user)
abstract class CartRepository {
  Cart userCart = const Cart({}); // Initialize cart here

  Cart fetchCart() {
    return userCart;
  }

  Stream<Cart> watchCart();

  Future<void> setCart(Cart cart) async {
    userCart = cart;
  }
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  // * Override this in the main method
  throw UnimplementedError();
}
