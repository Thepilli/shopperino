import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopperino/presentation/pages/cart_page/application/cart_service.dart';
import 'package:shopperino/presentation/pages/cart_page/domain/item.dart';

part 'add_to_cart_controller.g.dart';

@riverpod
class AddToCartController extends _$AddToCartController {
  @override
  FutureOr<int> build() {
    return 1;
  }

  void updateQuantity(int quantity) {
    print('called updateQuantity in ADDCONTROLLER');

    state = AsyncData(quantity);
  }

  Future<void> addItem(String foodId) async {
    print('called addItem in ADDCONTROLLER');

    final cartService = ref.read(cartServiceProvider);
    final item = Item(foodId: foodId, quantity: state.value!);
    state = const AsyncLoading<int>().copyWithPrevious(state);
    final value = await AsyncValue.guard(() => cartService.addItem(item));
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = const AsyncData(1);
    }
  }
}
