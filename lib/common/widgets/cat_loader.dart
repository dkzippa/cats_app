import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CatLoader extends StatelessWidget {
  const CatLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/114860-cat-paw-loading.json');
  }
}
