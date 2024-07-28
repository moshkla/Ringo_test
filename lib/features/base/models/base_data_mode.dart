import 'package:flutter/material.dart';

class BaseDataModel{
  final String name;
  final Widget widget;
  final Widget icon;
  final Widget iconActive;

  BaseDataModel(this.name, this.widget, this.icon, this.iconActive);
}