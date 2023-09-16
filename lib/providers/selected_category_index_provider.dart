import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_index_provider.g.dart';

@riverpod
class SelectedCategoryIndex extends _$SelectedCategoryIndex {
  @override
  int build() {
    return 0;
  }

  void selectCategory(int index) {
    state = index;
  }
}
