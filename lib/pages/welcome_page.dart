import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/app_colors.dart';
import '../widgets/responsive_button.dart';

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
              child: buildActionButtons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect:
          WormEffect(activeDotColor: Theme.of(context).primaryColor, paintStyle: PaintingStyle.stroke),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ResponsiveButton(
          width: 110,
          title: "Skip",
          textStyle: Theme.of(context).textTheme.headline4,
          onPressed: () {
            // Todo implement onskip clicked
          },
        ),
        ResponsiveButton(
          width: 110,
          title: "Next",
          textStyle: Theme.of(context).textTheme.headline3,
          onPressed: () => {
            // Todo implement onnext clicked
          },
        ),
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onboardPageView(
          const AssetImage('assets/coffee1.jpeg'),
          '''Checkout weekly recommended recipes and what your friends are cooking!''',
        ),
        onboardPageView(const AssetImage('assets/coffee2.webp'),
            'Cook with step by step instructions!'),
        onboardPageView(const AssetImage('assets/coffee3.jpeg'),
            'Keep track of what you need to buy'),
      ],
    );
  }

  Widget onboardPageView(ImageProvider imageProvider, String title) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                fit: BoxFit.fitWidth,
                image: imageProvider,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
