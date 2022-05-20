import 'package:flutter/material.dart';

class OnboardingPage {
  final AssetImage image;
  final String description;

  OnboardingPage({
    required this.image,
    required this.description,
  });
}

final onboardingPages = [
    OnboardingPage(
      image: const AssetImage('assets/coffee1.jpeg'),
      description:
          'Checkout weekly recommended recipes and what your friends are cooking!',
    ),
    OnboardingPage(
      image: const AssetImage('assets/coffee2.webp'),
      description: 'Cook with step by step instructions!',
    ),
    OnboardingPage(
      image: const AssetImage('assets/coffee3.jpeg'),
      description: 'Keep track of what you need to buy',
    ),
  ];