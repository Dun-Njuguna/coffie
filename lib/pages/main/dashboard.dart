import 'package:coffeeapp/pages/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../cart/cart.dart';
import '../favourite/favourite.dart';
import '../home/home.dart';
import '../notifications/notifications.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
    required this.currentTabName,
  }) : super(key: key);

  final String currentTabName;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static List<Widget> pages = <Widget>[
    const Home(),
    const Cart(),
    const Favourite(),
    const Notifications()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: dashboardTabs.indexOf(widget.currentTabName),
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: dashboardTabs.indexOf(widget.currentTabName),
        onDestinationSelected: (value) {
          context.goNamed(AppRoutes.home,
              params: {AppRoutes.selectedTab: dashboardTabs[value]});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
