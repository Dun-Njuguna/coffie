import 'package:coffeeapp/pages/navigation/app_routes.dart';
import 'package:coffeeapp/pages/state/login_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/OnboardingPage.dart';
import '../../widgets/custome_page_view.dart';
import '../../widgets/responsive_button.dart';
import '../state/app_state_manager.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: buildPages(),
            ),
            const SizedBox(height: 25),
            pageIndicator(),
            const SizedBox(height: 25),
            Expanded(
              flex: 1,
              child: Center(child: buildActionButtons()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(context, index);
      },
      children: getTextWidgets(onboardingPages),
    );
  }

  List<Widget> getTextWidgets(List<OnboardingPage> data) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < data.length; i++) {
      list.add(onboardPageView(context, data[i].image, data[i].description));
    }
    return list;
  }

  Widget pageIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: onboardingPages.length,
      effect: WormEffect(
        activeDotColor:
            Theme.of(context).buttonTheme.colorScheme?.primary ?? Colors.black,
        paintStyle: PaintingStyle.stroke,
        type: WormType.thin,
        dotHeight: 6,
        dotWidth: 16,
      ),
    );
  }

  Widget buildActionButtons() {
    return Consumer<AppStateManager>(builder: (
      context,
      appStateManager,
      child,
    ) {
      return appStateManager.getStartedButton == true
          ? buildStartButton(context)
          : buildNavigationButtons(context);
    });
  }

  Row buildNavigationButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ResponsiveButton(
          width: 110,
          title: "Skip",
          color: Theme.of(context).buttonTheme.colorScheme?.secondary,
          textStyle: Theme.of(context).textTheme.headline4,
          onPressed: () => completeOnbording(context),
        ),
        ResponsiveButton(
          width: 110,
          title: "Next",
          textStyle: Theme.of(context).textTheme.headline3,
          onPressed: () => {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            ),
          },
        ),
      ],
    );
  }

  Widget buildStartButton(BuildContext context) {
    return ResponsiveButton(
      width: 300,
      title: "Get Started",
      textStyle: Theme.of(context).textTheme.headline3,
      onPressed: () => completeOnbording(context),
    );
  }

  pageChanged(BuildContext context, int index) {
    if (index == onboardingPages.length - 1) {
      Provider.of<AppStateManager>(context, listen: false)
          .showGetStartedButton(true);
    } else if (Provider.of<AppStateManager>(context, listen: false)
        .getStartedButton) {
      Provider.of<AppStateManager>(context, listen: false)
          .showGetStartedButton(false);
    }
  }
}

void completeOnbording(BuildContext context) {
  Provider.of<LoginManager>(context, listen: false).completeOnboarding();
  context.go(AppRoutes.home);
}
