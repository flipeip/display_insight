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
          color: corSecundaria,
          offsetPadding: sizeConstOf(context) * 90.0,
          waveCount: (sizeConstOf(context) * 20).ceil(),
          duration: const Duration(seconds: 5),
          strokeWidth: sizeConstOf(context) * 4,
        ),
        Positioned(
          top: sizeConstOf(context) * -100,
          left: sizeConstOf(context) * -100,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                color: corPadrao,
                borderRadius: BorderRadius.all(Radius.circular(999.0))),
            child: ScalableImageWidget.fromSISource(
              si: ScalableImageSource.fromSvg(
                rootBundle,
                'assets/images/icone.svg',
              ),
              scale: sizeConstOf(context) * 5.0,
            ),
          ),
        ),
      ],
    );
  }
}
