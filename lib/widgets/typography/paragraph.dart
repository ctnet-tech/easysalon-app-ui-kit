import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Paragraph extends StatelessWidget {
  Paragraph(
      {this.content,
      this.contents,
      this.linePadding,
      this.size = LayoutSize.medium,
      this.weight = FontWeight.normal,
      this.color = ThemeColor.dark,
      this.decoration = TextDecoration.none,
      this.decorationStyle = TextDecorationStyle.solid,
      this.textAlign = TextAlign.left,
      this.italic = false,
      this.bold = false,
      this.hasAlignment = true,
      this.isCenter = false,
      this.underline = false}) {
    if (linePadding == null) {
      this.linePadding = LayoutNotifier.getLowerSize(this.size);
    }
  }

  final LayoutSize size;
  LayoutSize? linePadding;

  final bool hasAlignment;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final TextAlign textAlign;
  final bool italic;
  final bool bold;
  final bool underline;
  final bool isCenter;

  final FontWeight weight;
  final ThemeColor color;

  final String? content;
  final List<ParagraphContent>? contents;

  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    if (this.content == null && this.contents == null) {
      return Text("");
    }

    if (this.content != null) {
      return SpaceBox(
        bottomSize: this.linePadding,
        child: Container(
            alignment: hasAlignment ? Alignment.topLeft : null,
            child: isCenter
                ? Center(
                    child: Text(
                      this.content!,
                      style: TextStyle(
                          fontStyle: this.italic == true
                              ? FontStyle.italic
                              : FontStyle.normal,
                          decoration: this.underline
                              ? TextDecoration.underline
                              : this.decoration,
                          decorationStyle: this.decorationStyle,
                          fontSize: layout.sizeToFontSize(this.size),
                          fontWeight: this.bold ? FontWeight.bold : this.weight,
                          color: theme.getColor(this.color)),
                      textAlign: this.textAlign,
                    ),
                  )
                : Text(this.content!,
                    style: TextStyle(
                        fontStyle: this.italic == true
                            ? FontStyle.italic
                            : FontStyle.normal,
                        decoration: this.underline
                            ? TextDecoration.underline
                            : this.decoration,
                        decorationStyle: this.decorationStyle,
                        fontSize: layout.sizeToFontSize(this.size),
                        fontWeight: this.bold ? FontWeight.bold : this.weight,
                        color: theme.getColor(this.color)))),
      );
    }

    return SpaceBox(
        bottomSize: this.linePadding,
        child: Container(
            alignment: hasAlignment
                ? isCenter
                    ? Alignment.center
                    : Alignment.topLeft
                : null,
            child: RichText(
                textAlign: this.textAlign,
                text: TextSpan(
                    children: List.generate(
                        this.contents!.length,
                        (i) => TextSpan(children: [
                              TextSpan(
                                  text: this.contents![i].content!,
                                  style: TextStyle(
                                      height: 1.4,
                                      fontStyle:
                                          this.contents![i].italic == true
                                              ? FontStyle.italic
                                              : FontStyle.normal,
                                      decoration:
                                          this.contents![i].underline == true
                                              ? TextDecoration.underline
                                              : this.decoration,
                                      decorationStyle:
                                          this.contents![i].decorationStyle,
                                      fontSize: layout.sizeToFontSize(
                                          this.contents![i].size ?? this.size),
                                      fontWeight:
                                          this.contents![i].bold ?? this.bold
                                              ? FontWeight.bold
                                              : this.contents![i].weight,
                                      color: theme.getColor(
                                          this.contents![i].color ??
                                              this.color))),
                              TextSpan(text: " ")
                            ]))))));
  }
}
