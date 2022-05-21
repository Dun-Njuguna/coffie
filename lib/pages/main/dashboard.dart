import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/cart.dart';
import '../favourite/favourite.dart';
import '../home/home.dart';
import '../notifications/notifications.dart';
import '../state/app_state_manager.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

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
    return Consumer<AppStateManager>(
      builder: (
        context,
        appStateManager,
        child,
      ) {
        return Scaffold(
          body: IndexedStack(
            index: appStateManager.getCurretTab,
            children: pages,
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: appStateManager.getCurretTab,
            onDestinationSelected: (value) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(value);
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
      },
    );
  }
}
