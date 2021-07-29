import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final String? firstText;
  final String? secondText;
  final TextEditingController textEditingController;
  ThemeColor colorFirstText;
  LayoutSize sizeFirstText;
  ThemeColor colorSecondText;
  ThemeColor backgroundColor;
  LayoutSize sizeSecondText;
  TextStyle? textFieldTextStyle;
  TextStyle? textFieldHintTextStyle;
  double customHeight;
  double customWidth;
  bool isOnlyNumber;
  String hintText;
  bool hasObscureText;
  bool isDatePicker;
  int? minLine;
  int? maxLine;
  VoidCallback? onTapSecondText;
  Function(String)? onChangedTextField;
  ValueChanged<String>? onSubmitted;
  bool hasUpdate;
  String firstData;
  Widget? suffixIcon;
  EdgeInsets? padding;
  BorderRadiusGeometry? borderRadius;
  BoxBorder? border;

  CustomTextField({
    Key? key,
    this.firstText,
    this.secondText,
    required this.textEditingController,
    this.isOnlyNumber = false,
    this.hintText = "",
    this.hasObscureText = false,
    this.isDatePicker = false,
    this.minLine,
    this.maxLine,
    this.onTapSecondText,
    this.customHeight = 50,
    this.customWidth = double.infinity,
    this.sizeFirstText = LayoutSize.medium,
    this.sizeSecondText = LayoutSize.medium,
    this.colorFirstText = ThemeColor.secondary,
    this.colorSecondText = ThemeColor.dodgerBlue,
    this.textFieldHintTextStyle,
    this.textFieldTextStyle,
    this.onChangedTextField,
    this.onSubmitted,
    this.hasUpdate = false,
    this.firstData = "",
    this.suffixIcon,
    this.padding,
    this.borderRadius,
    this.backgroundColor = ThemeColor.lightest,
    this.border,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    if (widget.hasUpdate) {
      widget.textEditingController.text = widget.firstData;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!(widget.firstText == null && widget.secondText == null))
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Paragraph(
                    linePadding: LayoutSize.none,
                    color: widget.colorFirstText,
                    size: widget.sizeFirstText,
                    content: widget.firstText ?? "",
                    weight: FontWeight.w400,
                  ),
                  InkWell(
                    onTap: widget.onTapSecondText,
                    child: Paragraph(
                      linePadding: LayoutSize.none,
                      size: widget.sizeSecondText,
                      color: widget.colorSecondText,
                      content: widget.secondText ?? "",
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        Container(
          height: widget.customHeight,
          width: widget.customWidth,
          decoration: BoxDecoration(
            color: theme.getColor(widget.backgroundColor),
            borderRadius: widget.borderRadius == null
                ? layout.sizeToBorderRadius(LayoutSize.small)
                : widget.borderRadius,
            border: widget.border ??
                Border.all(
                  width: 1,
                  color: theme.getColor(ThemeColor.hawkesBlue),
                ),
          ),
          padding: widget.padding == null
              ? EdgeInsets.all(layout.sizeToPadding(LayoutSize.tiny))
              : widget.padding,
          child: TextField(
            minLines: widget.minLine,
            maxLines: widget.hasObscureText ? 1 : widget.maxLine,
            controller: widget.textEditingController,
            readOnly: widget.isDatePicker ? true : false,
            onChanged: widget.onChangedTextField,
            onSubmitted: widget.onSubmitted,
            inputFormatters: [
              if (widget.isOnlyNumber) FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType:
                widget.isOnlyNumber ? TextInputType.number : TextInputType.text,
            style: widget.textFieldTextStyle == null
                ? TextStyle(
                    fontSize: layout.sizeToFontSize(LayoutSize.medium),
                    color: theme.getColor(ThemeColor.dark),
                    fontWeight: FontWeight.w400,
                  )
                : widget.textFieldTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: widget.minLine == null ? true : false,
              suffixIcon: widget.suffixIcon != null
                  ? widget.suffixIcon
                  : widget.hasObscureText
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: CustomIcon(
                            icon:
                                isObscure ? LineIcons.eye_slash : LineIcons.eye,
                            size: LayoutSize.medium,
                          ),
                        )
                      : widget.isDatePicker
                          ? InkWell(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  locale: const Locale("vi"),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((dateTime) {
                                  setState(() {
                                    widget.textEditingController.text =
                                        DateFormat("dd/MM/yyyy")
                                            .format(dateTime!);
                                  });
                                });
                              },
                              child: CustomIcon(
                                icon: LineIcons.calendar_week,
                                size: LayoutSize.medium,
                              ),
                            )
                          : null,
              hintText: widget.hintText,
              hintStyle: widget.textFieldHintTextStyle == null
                  ? TextStyle(
                      fontSize: layout.sizeToFontSize(LayoutSize.medium),
                      color: theme.getColor(ThemeColor.secondary),
                      fontWeight: FontWeight.w400,
                    )
                  : widget.textFieldHintTextStyle,
            ),
            obscureText: widget.hasObscureText ? isObscure : false,
          ),
        ),
      ],
    );
  }
}
