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
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: tema().sombraLogo.withAlpha(50),
            blurRadius: 120,
            offset: Offset(0, 15)
          ),
        ],
      ),
      child: ScalableImageWidget.fromSISource(
        currentColor: tema().corTexto,
        si: ScalableImageSource.fromSI(
          rootBundle,
          tema().logo,
        ),
        scale: sizeConstOf(context) * 4,
      ),
    )
    );
  }
}
