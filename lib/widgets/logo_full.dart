import 'package:display/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

import '../utils.dart';

class LogoFull extends StatelessWidget {
  const LogoFull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScalableImageWidget.fromSISource(
        currentColor: corTexto(),
        si: ScalableImageSource.fromSI(
          rootBundle,
          'assets/vectors/logo.si',
        ),
        scale: sizeConstOf(context) * 4,
      ),
    );
  }
}
