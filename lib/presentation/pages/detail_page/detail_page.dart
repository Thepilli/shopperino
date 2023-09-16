// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopperino/app/app_colors.dart';
import 'package:shopperino/app/app_constants.dart';
import 'package:shopperino/data/models/food.dart';
import 'package:shopperino/presentation/pages/cart_page/add_to_cart_controller.dart';
import 'package:shopperino/presentation/pages/home_page/components/home_page_widgets.dart';
import 'package:shopperino/router/app_router.dart';
import 'package:shopperino/shared/extensions/build_context.dart';
import 'package:shopperino/shared/widgets/jbox.dart';

class DetailPage extends ConsumerWidget {
  Food food;
  DetailPage({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: context.primary,
          onPressed: () {
            ref.read(addToCartControllerProvider.notifier).addItem(food.foodId);
            print('added ${food.foodId}');
          },
          icon: Icon(Icons.shopping_bag_outlined),
          label: CircleAvatar(
            backgroundColor: AppColors.white,
            child: Text('99'),
          )),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImagePath.detail_bg,
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          buildAppBar(),
          Container(
            height: context.sizeHeight * .75,
            width: context.sizeWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                color: AppColors.scaffoldLight),
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(food.name, style: context.textTheme.titleLarge),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Details(IconPath.duration, food.waitTime),
                          Details(IconPath.star, '${food.score}'),
                          Details(IconPath.calories, food.calories),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: 220,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.background),
                            child: RichText(
                              text: TextSpan(text: '\$', style: context.textTheme.bodySmall, children: [
                                TextSpan(
                                  text: '${food.price}',
                                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.primary),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                                CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  child: Text('99'),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomLeft, child: Text('Ingredients', style: context.textTheme.titleLarge)),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: food.ingredients.length,
                          itemBuilder: (BuildContext context, int index) {
                            final ingredience = food.ingredients[index];
                            return Container(
                              constraints: BoxConstraints(minWidth: 80),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: context.background,
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    ingredience.values.first,
                                    height: 40,
                                    width: 40,
                                  ),
                                  JBox(height: 10),
                                  Text(ingredience.keys.first)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(alignment: Alignment.bottomLeft, child: Text('About', style: context.textTheme.titleLarge)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(food.about, style: context.textTheme.bodyMedium),
                      ),
                      IconButton(onPressed: () => context.pushNamed(Routes.cart.name), icon: Icon(Icons.shopping_bag)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: context.sizeHeight * .75 - 120,
              child: Hero(
                tag: food.foodId,
                child: Image.asset(
                  food.imageUrl,
                  height: 240,
                  width: 240,
                ),
              )),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarIcon(icon: Icons.chevron_left),
          AppBarIcon(icon: Icons.search),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String iconUrl;
  final String label;

  const Details(this.iconUrl, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconUrl,
          height: 30,
          width: 30,
        ),
        Text(label),
      ],
    );
  }
}
