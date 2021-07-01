import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParagraphList extends StatelessWidget {
  ParagraphList(
      {this.contents,
      this.texts,
      this.linePadding = LayoutSize.medium,
      this.leadingColor = ThemeColor.primary,
      this.size = LayoutSize.medium,
      this.weight = FontWeight.normal,
      this.color = ThemeColor.dark,
      this.italic = false,
      this.bold = false,
      this.underline = false});

  final LayoutSize size;
  final LayoutSize? linePadding;

  final bool italic;
  final bool bold;
  final bool underline;

  final FontWeight weight;
  final ThemeColor color;
  final ThemeColor leadingColor;

  final List<ParagraphContent>? contents;
  final List<String>? texts;

  _dot(theme) {
    return SpaceBox(
        rightSize: LayoutSize.large,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: theme.getColor(this.leadingColor)),
        ));
  }

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();

    if (this.texts == null && this.contents == null) {
      return Text("");
    }

    if (this.texts != null) {
      return Column(
          children: List.generate(
              this.texts!.length,
              (i) => SpaceBox(
                  bottomSize: this.linePadding,
                  child: Row(children: [
                    _dot(theme),
                    Expanded(
                        child: Paragraph(
                      content: this.texts![i],
                      bold: this.bold,
                      color: this.color,
                      italic: this.italic,
                      size: this.size,
                      underline: this.underline,
                      weight: this.weight,
                      linePadding: LayoutSize.none,
                    ))
                  ]))));
    }

    return Column(
        children: List.generate(
            this.contents!.length,
            (i) => SpaceBox(
                bottomSize: this.linePadding,
                child: Row(children: [
                  _dot(theme),
                  Expanded(
                      child: Paragraph(
                    content: this.contents![i].content!,
                    bold: this.contents![i].bold ?? this.bold,
                    color: this.contents![i].color ?? this.color,
                    decoration: this.contents![i].decoration,
                    decorationStyle: this.contents![i].decorationStyle,
                    italic: this.contents![i].italic ?? this.italic,
                    size: this.contents![i].size ?? this.size,
                    underline: this.contents![i].underline ?? this.underline,
                    weight: this.contents![i].weight ?? this.weight,
                    linePadding: LayoutSize.none,
                  ))
                ]))));
  }
}
