import '../tema.dart';
import '../utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

class LogoPrestcontas extends StatelessWidget {
  const LogoPrestcontas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: sizeConstOf(context) * 45,
        horizontal: sizeConstOf(context) * 60,
      ),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: tema().sombraLogo,
            blurRadius: 60,
            offset: Offset(60, 0)
          ),
        ],
      ),
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
