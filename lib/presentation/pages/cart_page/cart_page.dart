import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopperino/presentation/pages/cart_page/application/cart_service.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/cart.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/item.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Cart cart = ref.watch(cartServiceProvider).userCart;
    List<Item> items = cart.toItemsList();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return ListTile(
              title: Text("ID: ${item.foodId}"),
              subtitle: Text('Q: ${item.quantity}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(cartServiceProvider).removeItemById(item.foodId);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
