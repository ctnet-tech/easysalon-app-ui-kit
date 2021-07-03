import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAdmin extends StatelessWidget {
  final LayoutSize size;
  double? customHeight;
  double? customWidth;
  final Function? onTapIconAdd;

  ProfileAdmin(
      {this.size = LayoutSize.medium,
      this.customHeight,
      this.customWidth,
      this.onTapIconAdd});

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var height = customHeight ?? MediaQuery.of(context).size.height / 3;
    var width = customWidth ?? MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: theme.getColor(ThemeColor.bondiBlue),
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
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS54088iJjHpn-y9FCxGAh5NBEdHugwIXewWQ&usqp=CAU",
                                fit: BoxFit.fill,
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 6,
                            child: CustomIcon(
                              icon: Icons.add,
                              size: LayoutSize.large,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Phan Nhật Nam",
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
                        "nhatnam1121@example.com",
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.getColor(ThemeColor.lightest),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Admin",
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
                    onTap: () {},
                    child: CustomIcon(
                      icon: LineIcons.edit_square_feather,
                      size: LayoutSize.large,
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
