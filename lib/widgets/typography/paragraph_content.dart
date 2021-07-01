import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/material.dart';

class ParagraphContent {
  ParagraphContent(
      {this.content,
      this.size,
      this.decoration,
      this.decorationStyle,
      this.italic,
      this.bold,
      this.underline,
      this.weight,
      this.color});

  final String? content;

  final LayoutSize? size;

  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;

  final bool? italic;
  final bool? bold;
  final bool? underline;

  final FontWeight? weight;
  final ThemeColor? color;
}
