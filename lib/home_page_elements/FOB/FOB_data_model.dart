
import 'package:flutter/material.dart';

class CommonFOBWidgetStruct{
  final double              size;
  final String              toolTip;
  final VoidCallback        cbk;
  final Key?                widgetKey;
  final IconData?           icon;
  final AnimationController controller;
  final Color?              color;

  CommonFOBWidgetStruct({required this.size, required this.toolTip, required this.cbk, this.widgetKey, required this.icon, required this.controller, this.color });
}
