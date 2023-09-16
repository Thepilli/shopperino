import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopperino/presentation/pages/cart_page/application/cart_service.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int itemcount = ref.watch(cartItemCountProvider);

    return Center(
      child: Text('$itemcount'),
    );
  }
}
