import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/state/profile_manager.dart';
import '../utils/app_colors.dart';

class CoffeeGridView extends StatelessWidget {
  final Function itemClicked;

  const CoffeeGridView({
    Key? key,
    required this.itemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisExtent: 300,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CoffeeCardView(itemClicked: itemClicked);
      },
    );
  }
}

class CoffeeCardView extends StatelessWidget {
  final Function itemClicked;

  const CoffeeCardView({
    Key? key,
    required this.itemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileManager>(builder: (context, profileManager, child) {
      final isDarkMode =
          Provider.of<ProfileManager>(context, listen: true).getDarkMode;
      Color cardBackgrondcolor;
      if (isDarkMode) {
        cardBackgrondcolor = AppColors.darkCoffeeBackgroundColor;
      } else {
        cardBackgrondcolor = AppColors.lightCoffeeBackgroundColor;
      }
      return GestureDetector(
        onTap: () {
          itemClicked();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: cardBackgrondcolor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: cardBackgrondcolor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCoffeeThumbnail(),
              const SizedBox(height: 10),
              Text(
                "Cinamon & Cocoa",
                maxLines: 1,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),
              buidAddToCartView(context),
            ],
          ),
        ),
      );
    });
  }

  Expanded buildCoffeeThumbnail() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/coffee_cup1.jpeg',
          fit: BoxFit.cover,
          height: 200,
          width: 300,
        ),
      ),
    );
  }

  Widget buidAddToCartView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "\$25.0",
          style: Theme.of(context).textTheme.headline3,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightHighlightsColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.lightHighlightsColor,
          ),
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
