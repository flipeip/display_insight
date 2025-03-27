import '../tema.dart';
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
        currentColor: tema().corTexto,
        si: ScalableImageSource.fromSI(
          rootBundle,
          tema().logo,
        ),
        scale: sizeConstOf(context) * 4,
      ),
    );
  }
}
