import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopperino/app/app_colors.dart';
import 'package:shopperino/providers/selected_category_index_provider.dart';
import 'package:shopperino/shared/extensions/build_context.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({
    super.key,
    required this.category,
    required this.selectedCategoryIndex,
  });

  final List<String> category;
  final int selectedCategoryIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              ref.read(selectedCategoryIndexProvider.notifier).selectCategory(index);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: index == selectedCategoryIndex ? context.primary : context.background,
                        blurRadius: 3,
                        offset: const Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.circular(99),
                  color: index == selectedCategoryIndex ? context.primary : context.background,
                ),
                child: Text(category[index])),
          );
        },
      ),
    );
  }
}

class RestaurantChip extends StatelessWidget {
  final String label;
  final bool noBg;
  const RestaurantChip({
    super.key,
    required this.label,
    this.noBg = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: noBg ? Colors.transparent : context.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: context.textTheme.bodyMedium?.copyWith(color: noBg ? AppColors.txtDark : AppColors.white),
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  const AppBarIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: AppColors.white),
      child: Icon(icon),
    );
  }
}
