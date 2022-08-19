import 'package:flutter/cupertino.dart';

extension DeviceSize on BuildContext {
  double screenHeight() => MediaQuery.of(this).size.height;

  double screenWidth() => MediaQuery.of(this).size.width;
}
