import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:snow_widget/widget/snow_widget.dart';

import '../tema.dart';
import '../utils.dart';
import 'ondas.dart';

class Fundo extends StatelessWidget {
  final Color? corDasParticulas;

  const Fundo({super.key, this.corDasParticulas});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ondas(
          color: tema().corPrimaria,
          repeat: true,
          offsetPadding: sizeConstOf(context) * 280.0,
          waveCount: 30,
          duration: const Duration(seconds: 5),
          strokeWidth: sizeConstOf(context) * 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: tema().corFundo,
                borderRadius: const BorderRadius.all(Radius.circular(999.0))),
            child: ScalableImageWidget.fromSISource(
              currentColor: tema().corPrimaria,
              si: ScalableImageSource.fromSI(
                rootBundle,
                'assets/vectors/icone.si',
              ),
              scale: 12 * sizeConstOf(context),
            ),
          ),
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
