import 'package:flutter/material.dart';

class GuestClass {
  final String title;
  final String? mb;
      final String? days;
  final String icon;
  final Widget page;

  GuestClass(this.title, this.icon, {required this.page, this.mb, this.days,});
}

