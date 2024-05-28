import 'package:flutter/material.dart';

class LogoPrestcontas extends StatelessWidget {
  const LogoPrestcontas({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.24,
      child: Image.asset(
        'assets/images/logo_prestcontas.png',
      ),
    );
  }
}
