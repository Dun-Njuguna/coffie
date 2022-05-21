import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
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
          ],
        ),
      ),
    );
  }

  Widget profileButton(BuildContext context) {
    return GestureDetector(
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/person_1.jpg'),
      ),
      onTap: () {
        context.goNamed(AppRoutes.profile);
      },
    );
  }
}
