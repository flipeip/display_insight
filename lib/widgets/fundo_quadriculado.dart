import 'package:flutter/material.dart';
import 'package:snow_widget/widget/snow_widget.dart';

import '../utils.dart';
import 'quadriculado.dart';

class FundoQuadriculado extends StatelessWidget {
  final Color? corDasParticulas;

  const FundoQuadriculado({super.key, this.corDasParticulas});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Quadriculado(
          color: Colors.black,
          scale: 50 * sizeConstOf(context),
          duration: Duration(seconds: 5),
        ),
        if (corDasParticulas != null)
          Positioned.fill(
            child: SnowWidget(
              totalSnow: 500,
              speed: 0.5,
              isRunning: true,
              snowColor: corDasParticulas!,
            ),
          ),
      ],
    );
  }
}
