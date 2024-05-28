import 'package:display/utils.dart';
import 'package:flutter/material.dart';

class LogoPrestcontas extends StatelessWidget {
  const LogoPrestcontas({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_prestcontas.png',
      scale: sizeConstOf(context),
    );
  }
}
