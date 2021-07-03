import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/profile_customer_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph_content.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParagraphPage extends StatefulWidget {
  static const String path = '/pages/widgets/paragraph_page';

  ParagraphPage() : super(key: Key("Typography"));

  @override
  _ParagraphPageState createState() => _ParagraphPageState();
}

class _ParagraphPageState extends State<ParagraphPage> {
  Widget _paragraph() {
    return SpaceBox(
      bottomSize: LayoutSize.big,
      child: Column(
        children: [
          ProfileCustomerTag(iconButton: LineIcons.store,)


        ],
      ),
    );
  }

  Widget _richParagraph() {
    return SpaceBox(
      bottomSize: LayoutSize.big,
      child: Column(
        children: [
          Paragraph(
            content: "Rich Paragraph",
            size: LayoutSize.large,
            weight: FontWeight.bold,
            color: ThemeColor.secondary,
          ),
          Paragraph(
            contents: [
              ParagraphContent(
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              ),
              ParagraphContent(
                content: "Nulla id feugiat odio, id posuere odio.",
                color: ThemeColor.primary,
                italic: true,
              ),
              ParagraphContent(
                content:
                    "Maecenas turpis odio, dapibus quis suscipit at, volutpat ut neque.",
                color: ThemeColor.warning,
                bold: true,
              ),
              ParagraphContent(
                content:
                    "Integer a lacus interdum, posuere turpis in, pulvinar velit.",
                color: ThemeColor.danger,
                underline: true,
              ),
              ParagraphContent(
                content: "Sed finibus mauris eu convallis congue.",
                color: ThemeColor.secondary,
                decoration: TextDecoration.lineThrough,
              ),
              ParagraphContent(
                content:
                    "Curabitur malesuada ligula libero, nec mattis tellus gravida pharetra.",
                color: ThemeColor.dark,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listParagraph() {
    return SpaceBox(
      bottomSize: LayoutSize.big,
      child: Column(
        children: [
          Paragraph(
            content: "List Paragraph",
            size: LayoutSize.large,
            weight: FontWeight.bold,
            color: ThemeColor.secondary,
          ),
          ParagraphList(
            contents: [
              ParagraphContent(
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              ),
              ParagraphContent(
                content: "Nulla id feugiat odio, id posuere odio.",
                color: ThemeColor.primary,
                italic: true,
              ),
              ParagraphContent(
                content:
                    "Maecenas turpis odio, dapibus quis suscipit at, volutpat ut neque.",
                color: ThemeColor.warning,
                bold: true,
              ),
              ParagraphContent(
                content:
                    "Integer a lacus interdum, posuere turpis in, pulvinar velit.",
                color: ThemeColor.danger,
                underline: true,
              ),
              ParagraphContent(
                content: "Sed finibus mauris eu convallis congue.",
                color: ThemeColor.secondary,
                decoration: TextDecoration.lineThrough,
              ),
              ParagraphContent(
                content:
                    "Curabitur malesuada ligula libero, nec mattis tellus gravida pharetra.",
                color: ThemeColor.dark,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listParagraphSimple() {
    return SpaceBox(
      bottomSize: LayoutSize.big,
      child: Column(
        children: [
          Paragraph(
            content: "List Paragraph",
            size: LayoutSize.large,
            weight: FontWeight.bold,
            color: ThemeColor.secondary,
          ),
          ParagraphList(leadingColor: ThemeColor.danger, texts: [
            "Nulla id feugiat odio, id posuere odio.",
            "Donec eget massa at ligula pulvinar hendrerit.",
            "Aliquam tempus tellus dui, sit amet dictum.",
            "Aenean et sodales tellus.",
            "Donec viverra in nibh eu rutrum.",
            "Cras eleifend eget ipsum eu porta.",
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header:
            PageHeader(title: "Paragraph", description: "Basic text writing"),
        children: [
          SpaceBox(
              all: true,
              child: Column(
                children: [
                  _paragraph(),

                ],
              ))
        ]);
  }
}
