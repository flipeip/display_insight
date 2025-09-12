import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:shadow_widget/shadow_widget.dart';

import '../tema.dart';
import '../utils.dart';

class LogoFull extends StatelessWidget {
  const LogoFull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadowWidget(
        blurRadius: 15 * sizeConstOf(context),
        offset: Offset(0, 10 * sizeConstOf(context)),
        color: tema().sombra,
        child: ScalableImageWidget.fromSISource(
          currentColor: tema().corTexto,
          si: ScalableImageSource.fromSI(
            rootBundle,
            tema().logo,
          ),
          scale: sizeConstOf(context) * 4,
        ),
      ),
    );
  }
}
