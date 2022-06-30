import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CoffeeDetail extends StatelessWidget {
  const CoffeeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: buildImageViewHolder(context),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTitleView(context),
                        buildFavoriteButton(context),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    buildDescriptionView(context),
                    const SizedBox(
                      height: 20,
                    ),
                    buildMilkChoiceCards(context),
                    const SizedBox(
                      height: 30,
                    ),
                    buildAddToCartView(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ClipRRect buildImageViewHolder(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(40.0),
    child: Image.asset(
      'assets/coffee_cup1.jpeg',
      fit: BoxFit.cover,
    ),
  );
}

Column buildTitleView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Cappuccino",
        style: Theme.of(context).textTheme.headline2,
      ),
      Row(
        children: [
          Text(
            "Drizzeld with Caramel",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(width: 8),
          buildRatingView(context),
        ],
      ),
    ],
  );
}

Row buildRatingView(BuildContext context) {
  return Row(
    children: const [
      Icon(
        Icons.star,
        color: Colors.red,
        size: 18,
      ),
      SizedBox(width: 8),
      Text("4.5")
    ],
  );
}

IconButton buildFavoriteButton(BuildContext context) {
  return IconButton(
    iconSize: 28,
    color: Colors.red,
    icon: const Icon(Icons.favorite_outline),
    onPressed: () {},
  );
}

Widget buildDescriptionView(BuildContext context) {
  return ExpandableText(
    "Espresso is different from regular American coffee in many ways. It's typically made using dark roasted coffee beans that are very finely ground and brewed in a special espresso machine that forces hot water at high pressure through the ground coffee. The resulting espresso is dark, ideally with a layer of creamy-colored crema on the top. In Italian, espresso means pressed out, from the Latin exprimere, squeeze out.",
    expandText: 'show more',
    collapseText: 'show less',
    maxLines: 4,
    linkColor: Colors.red,
    animation: true,
    collapseOnTextTap: true,
    style: Theme.of(context).textTheme.headline4,
  );
}

Widget buildMilkChoiceCards(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Choice of Milk",
        style: Theme.of(context).textTheme.headline3,
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: milkChoices.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Row(
            children: [
              getIngredientCard(context, milkChoices[index]),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget getIngredientCard(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColorDark,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColorDark,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    ),
  );
}

Widget buildAddToCartView(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "\$25.0",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 6,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    width: 2.0,
                  ),
                ),
              ),
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColorDark)),
          child: const Text('Add to Cart'),
          onPressed: () {},
        ),
      ),
    ],
  );
}
