import 'package:easysalon_mobile_ui_kit/bloc/date_range_picker_bloc/date_range_picker_bloc.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditableYear extends StatefulWidget {
  const EditableYear({Key? key}) : super(key: key);

  @override
  _EditableYearState createState() => _EditableYearState();
}

class _EditableYearState extends State<EditableYear> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DateRangePickerBloc>(
      builder: (context, model, child) {
        return SpaceBox(
          all: true,
          size: LayoutSize.small,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.read<DateRangePickerBloc>().changeYear(
                      year: context.read<DateRangePickerBloc>().year! - 1);
                },
                child: CustomIcon(
                  icon: LineIcons.chevron_left,
                  size: LayoutSize.medium,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Paragraph(
                content: context.read<DateRangePickerBloc>().year.toString(),
                color: ThemeColor.dark,
                size: LayoutSize.medium,
                linePadding: LayoutSize.none,
                weight: FontWeight.w400,
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  context.read<DateRangePickerBloc>().changeYear(
                      year: context.read<DateRangePickerBloc>().year! + 1);
                },
                child: CustomIcon(
                  icon: LineIcons.chevron_right,
                  size: LayoutSize.medium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
