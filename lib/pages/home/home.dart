import 'package:coffeeapp/utils/app_colors.dart';
import 'package:coffeeapp/widgets/coffee_card_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../navigation/app_routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'de`ja`',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'Brew',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  profileButton(context),
                ],
              ),
            ),
            const SizedBox(height: 16),
            buildSearchButton(context),
            const SizedBox(height: 16),
            buildHomeContent(context)
          ],
        ),
      ),
    );
  }

  Widget profileButton(BuildContext context) {
    return GestureDetector(
      child: const CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.lightHighlightsColor,
        backgroundImage: AssetImage('assets/person_1.jpg'),
      ),
      onTap: () {
        context.goNamed(AppRoutes.profile,
            params: {AppRoutes.selectedTab: dashboardTabs.first});
      },
    );
  }

  Widget buildSearchButton(BuildContext context) {
    final outlineColor =
        Theme.of(context).navigationBarTheme.indicatorColor ?? Colors.black;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        cursorColor: Theme.of(context).navigationBarTheme.indicatorColor,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: outlineColor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: outlineColor, width: 2.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: outlineColor,
          ),
          hintText: 'Browse your favorite coffee..',
        ),
      ),
    );
  }

  Widget buildHomeContent(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHighlightList(context),
          const SizedBox(width: 10),
          buildPopularCardList(context),
        ],
      ),
    );
  }

  Expanded buildHighlightList(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightHighlightsColor,
          ),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(50)),
          color: AppColors.lightHighlightsColor,
        ),
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coffeeTypes.length,
          itemBuilder: (context, index) => Column(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: GestureDetector(
                  child: Text(
                    coffeeTypes[index],
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildPopularCardList(BuildContext context) {
    return Expanded(
      flex: 6,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CoffeeGridView(
            itemClicked: () {
              context.goNamed(AppRoutes.coffeeDetail,
                  params: {AppRoutes.selectedTab: dashboardTabs.first});
            },
          ),
        ),
      ),
    );
  }
}
