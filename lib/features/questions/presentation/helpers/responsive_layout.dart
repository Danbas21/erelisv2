import 'package:flutter/material.dart';

enum DeviceType {
  mobile,
  tablet,
  desktop,
}

class ResponsiveLayout {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return DeviceType.mobile;
    } else if (width < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  static Widget builder({
    required BuildContext context,
    required Widget Function(BuildContext, DeviceType) builder,
  }) {
    final deviceType = getDeviceType(context);
    return builder(context, deviceType);
  }
}
