import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownSearch extends StatefulWidget {
  final String hintText;

  const DropDownSearch({Key? key, this.hintText = ""}) : super(key: key);

  @override
  _DropDownSearchState createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  TextEditingController controller = TextEditingController();
  FocusNode focus = new FocusNode();
  bool isExpanded = false;

  @override
  void initState() {
    focus.addListener(() {
      if (focus.hasFocus)
        setState(() {
          isExpanded = true;
        });
      else
        setState(() {
          isExpanded = false;
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();

    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                focusNode: focus,
                textInputAction: TextInputAction.search,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: theme.getColor(ThemeColor.dark),
                  letterSpacing: 0.5,
                ),
                decoration: InputDecoration(
                  suffixIcon: CustomIcon(
                    icon: LineIcons.chevron_down,
                    size: LayoutSize.medium,
                    color: ThemeColor.spindle,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide(color: theme.getColor(ThemeColor.hawkesBlue))),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: theme.getColor(ThemeColor.secondary),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                controller: controller,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        if (isExpanded)
          Container(
            color: theme.getColor(ThemeColor.lightest),
            height: 200,
            child: ListView.builder(itemBuilder: (context, index) {
              return SpaceBox(
                all: true,
                child: Paragraph(
                  content: "Item",
                  color: ThemeColor.dark,
                  weight: FontWeight.w400,
                  linePadding: LayoutSize.none,
                ),
              );
            }),
          ),
      ],
    );
  }
}
