import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:shadow_widget/shadow_widget.dart';

import '../tema.dart';
import '../utils.dart';

class LogoPrestcontas extends StatelessWidget {
  const LogoPrestcontas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: sizeConstOf(context) * 45,
        horizontal: sizeConstOf(context) * 60,
      ),
      child: ShadowWidget(
        blurRadius: 8 * sizeConstOf(context),
        offset: Offset(0, 5 * sizeConstOf(context)),
        color: tema().sombra,
        child: SizedBox(
          height: sizeConstOf(context) * 85,
          child: ScalableImageWidget.fromSISource(
            alignment: Alignment.topRight,
            currentColor: tema().corTexto,
            si: ScalableImageSource.fromSI(
              rootBundle,
              'assets/vectors/logo_prestcontas.si',
            ),
            scale: sizeConstOf(context) * 4,
          ),
        ),
      ),
    );
  }
}
