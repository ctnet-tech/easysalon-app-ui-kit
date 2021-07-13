import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/shape.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAdmin extends StatelessWidget {
  final LayoutSize size;
  double? customHeight;
  double? customWidth;
  final Function onTapIconAdd;
  final Function onTapIconEdit;
  final String avartaUrl;
  final String nameText;
  final String emailText;
  final String roleText;

  ProfileAdmin({
    this.size = LayoutSize.medium,
    this.customHeight,
    this.customWidth,
    required this.onTapIconEdit,
    required this.onTapIconAdd,
    required this.avartaUrl,
    required this.nameText,
    required this.emailText,
    required this.roleText,
  });

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var height = customHeight ?? MediaQuery.of(context).size.height / 3;
    var width = customWidth ?? MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: theme.getColor(ThemeColor.dodgerBlue),
      ),
      height: height,
      width: width,
      child: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(layout.sizeToPadding(size)),
                            child: ClipRRect(
                              borderRadius: layout.sizeToBorderRadius(size),
                              child: Image.network(
                                avartaUrl,
                                fit: BoxFit.fill,
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 6,
                            child: InkWell(
                              onTap: onTapIconAdd(),
                              child: Shape(
                                color: ThemeColor.pastelGreen,
                                circle: true,
                                customHeight: 30,
                                customWidth: 30,
                                child: Center(
                                  child: CustomIcon(
                                    icon: Icons.add,
                                    size: LayoutSize.large,
                                    color: ThemeColor.lightest,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        nameText,
                        style: TextStyle(
                          color: theme.getColor(ThemeColor.lightest),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        emailText,
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.getColor(ThemeColor.lightest),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        roleText,
                        style: TextStyle(
                          color: theme.getColor(ThemeColor.lightest),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 6,
                  child: InkWell(
                    onTap: onTapIconEdit(),
                    child: CustomIcon(
                      icon: LineIcons.edit_square_feather,
                      size: LayoutSize.large,
                      color: ThemeColor.lightest,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
