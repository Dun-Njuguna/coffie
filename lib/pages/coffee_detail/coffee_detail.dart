import 'package:flutter/material.dart';

class CoffeeDetail extends StatelessWidget {
  const CoffeeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Coffee detail page"),
        ),
      ),
    );
  }
}
