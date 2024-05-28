import 'package:flutter/widgets.dart';

double sizeConstOf(BuildContext context) {
  final ratio = MediaQuery.devicePixelRatioOf(context);
  final size = MediaQuery.sizeOf(context).width / 1980;
  return size * ratio;
}
