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
  bool isOnlyNumber;
  String hintText;
  bool hasObscureText;
  bool isDatePicker;
  int? minLine;
  int? maxLine;

  CustomTextField({
    Key? key,
    this.firstText,
    this.secondText,
    required this.textEditingController,
    this.isOnlyNumber=false,
    this.hintText = "",
    this.hasObscureText = false,
    this.isDatePicker = false,
    this.minLine,
    this.maxLine,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

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
                    color: ThemeColor.secondary,
                    content: widget.firstText ?? "",
                    weight: FontWeight.w400,
                  ),
                  Paragraph(
                    linePadding: LayoutSize.none,
                    color: ThemeColor.dodgerBlue,
                    content: widget.secondText ?? "",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        TextField(
          minLines: widget.minLine ?? 1,
          maxLines: widget.minLine!=null? null : widget.maxLine ?? 1,
          controller: widget.textEditingController,
          readOnly: widget.isDatePicker?true:false,
          inputFormatters: [
            if (widget.isOnlyNumber) FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType:
              widget.isOnlyNumber ? TextInputType.number : TextInputType.text,
          style: TextStyle(
            fontSize: layout.sizeToFontSize(LayoutSize.medium),
            color: theme.getColor(ThemeColor.dark),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.hasObscureText
                ?  InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: CustomIcon(
                          icon: isObscure ? LineIcons.eye_slash : LineIcons.eye,
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
                        DateFormat("dd/MM/yyyy").format(dateTime!);
                  });
                });
              },
              child: CustomIcon(
                icon: LineIcons.calendar_week,
                size: LayoutSize.medium,
              ),
            )
                :null,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.getColor(
                  ThemeColor.hawkesBlue,
                ),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                    layout.sizeToBorderRadiusSize(LayoutSize.small)),
              ),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: layout.sizeToFontSize(LayoutSize.medium),
              color: theme.getColor(ThemeColor.secondary),
              fontWeight: FontWeight.w400,
            ),
          ),
          obscureText: widget.hasObscureText ? isObscure : false,
        ),
      ],
    );
  }
}
