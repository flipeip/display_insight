import 'package:flutter/widgets.dart';

double sizeConstOf(BuildContext context) {
  final ratio = MediaQuery.sizeOf(context).width / 1980;
  return ratio;
}
