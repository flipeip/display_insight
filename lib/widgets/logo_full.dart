import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
        si: ScalableImageSource.fromSvg(
          rootBundle,
          'assets/images/logo.svg',
        ),
        scale: sizeConstOf(context) * 4,
      ),
    );
  }
}
