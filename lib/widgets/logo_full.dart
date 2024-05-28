import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jovial_svg/jovial_svg.dart';

class LogoFull extends StatelessWidget {
  const LogoFull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.50,
        width: MediaQuery.of(context).size.width,
        child: ScalableImageWidget.fromSISource(
          si: ScalableImageSource.fromSvg(
            rootBundle,
            'assets/images/logo.svg',
          ),
        ),
      ),
    );
  }
}
