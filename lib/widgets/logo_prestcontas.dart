import 'package:display/utils.dart';
import 'package:flutter/material.dart';

class LogoPrestcontas extends StatelessWidget {
  const LogoPrestcontas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeConstOf(context) * 60,
        vertical: sizeConstOf(context) * 45,
      ),
      child: SizedBox(
        height: sizeConstOf(context) * 90,
        child: Image.asset(
          fit: BoxFit.fitHeight,
          'assets/images/logo_prestcontas.png',
        ),
      ),
    );
  }
}
