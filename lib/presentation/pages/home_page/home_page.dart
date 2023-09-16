// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopperino/app/app_colors.dart';
import 'package:shopperino/app/app_constants.dart';
import 'package:shopperino/data/models/food.dart';
import 'package:shopperino/data/models/restaurant.dart';
import 'package:shopperino/presentation/pages/home_page/components/home_page_widgets.dart';
import 'package:shopperino/providers/selected_category_index_provider.dart';
import 'package:shopperino/router/app_router.dart';
import 'package:shopperino/shared/extensions/build_context.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController();
    int selectedCategoryIndex = ref.watch(selectedCategoryIndexProvider);
    Restaurant restaurant = Restaurant.getResturant();
    final category = restaurant.menu.keys.toList();
    List<Food> foodList = restaurant.menu[category[selectedCategoryIndex]]!;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: context.sizeHeight * .2,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: context.textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          RestaurantChip(
                            label: restaurant.waitTime,
                          ),
                          RestaurantChip(label: restaurant.distance, noBg: true),
                          RestaurantChip(label: restaurant.label, noBg: true),
                        ],
                      ),
                      Text(
                        '"${restaurant.description}"',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImagePath.avatar),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_outline_rounded,
                            color: AppColors.ratingIconColor,
                          ),
                          Text(
                            '${restaurant.score}',
                            style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CategoryList(category: category, selectedCategoryIndex: selectedCategoryIndex),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  Food food = foodList[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.background,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: food.foodId,
                            child: Image.asset(
                              food.imageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.name,
                                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                food.description,
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: food.highLight ? context.primary : AppColors.txtLightSec),
                              ),
                              RichText(
                                text: TextSpan(text: '\$', style: context.textTheme.bodySmall, children: [
                                  TextSpan(
                                    text: '${food.price}',
                                    style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              context.pushNamed(Routes.detail.name, extra: food);
                            },
                            icon: Icon(Icons.chevron_right))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
            ),
            alignment: Alignment.centerLeft,
            height: 40,
            child: AnimatedSmoothIndicator(
              activeIndex: ref.watch(selectedCategoryIndexProvider),
              effect: WormEffect(activeDotColor: context.primary),
              count: category.length,
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AppBarIcon(icon: Icons.chevron_left),
          AppBarIcon(icon: Icons.search),
        ],
      ),
    );
  }
}
