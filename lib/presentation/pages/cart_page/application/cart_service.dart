import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopperino/presentation/pages/cart_page/data/cart_repository.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/cart.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/item.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/mutable_cart.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;
  Cart userCart = const Cart({}); // Initialize cart here

  /// fetch the cart from the local repository
  Cart _fetchCart() {
    print('called _fetchCart in SERVICE');
    return userCart;
  }

  /// save the cart to the local repository
  Future<void> _setCart(Cart cart) async {
    userCart = cart;
    print('called _setCart in SERVICE');
  }

  /// sets an item in the local cart
  Future<void> setItem(Item item) async {
    final cart = _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
    print('called setItem in SERVICE');
  }

  /// adds an item in the local cart
  Future<void> addItem(Item item) async {
    final cart = _fetchCart();
    final updated = cart.addItem(item);
    await _setCart(updated);
    print('called addItem in SERVICE');
  }

  /// removes an item from the local cart
  Future<void> removeItemById(String foodID) async {
    final cart = _fetchCart();
    final updated = cart.removeItemById(foodID);
    await _setCart(updated);
    print('called removeItemById in SERVICE');
  }
}

@Riverpod(keepAlive: true)
CartService cartService(CartServiceRef ref) {
  return CartService(ref);
}

@Riverpod(keepAlive: true)
Stream<Cart> cart(CartRef ref) {
  return ref.watch(cartRepositoryProvider).watchCart();
}

@riverpod
int cartItemCount(CartItemCountRef ref) {
  return ref.watch(cartServiceProvider).userCart.items.length;
}
