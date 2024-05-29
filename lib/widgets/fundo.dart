import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jovial_svg/jovial_svg.dart';

import '../tema.dart';
import '../utils.dart';
import 'ondas.dart';

class Fundo extends StatelessWidget {
  const Fundo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ondas(
          color: corSecundaria(),
          offsetPadding: sizeConstOf(context) * 280.0,
          waveCount: 30,
          duration: const Duration(seconds: 5),
          strokeWidth: sizeConstOf(context) * 10,
        ),
        Positioned(
          top: sizeConstOf(context) * -100,
          left: sizeConstOf(context) * -100,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: corPadrao(),
                borderRadius: const BorderRadius.all(Radius.circular(999.0))),
            child: ScalableImageWidget.fromSISource(
              currentColor: corSecundaria(),
              si: ScalableImageSource.fromSI(
                rootBundle,
                'assets/vectors/icone.si',
              ),
              scale: sizeConstOf(context) * 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
