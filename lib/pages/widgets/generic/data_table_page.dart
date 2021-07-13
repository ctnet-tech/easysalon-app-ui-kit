import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button_group.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/chart.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/data_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DataTablePage extends StatelessWidget {
  static const String path = '/pages/widgets/data_table_page';

  const DataTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StandardPage(
        header: PageHeader(
            title: "table Custom", description: "To trigger an operation."),
        children: [
          DataTableCustom(

            endRowBold: true,
            hasEndRow: true,
            colorsData: [ThemeColor.dodgerBlue, ThemeColor.dark],
            colorEndRow: [ThemeColor.dark],
            dataFistRow: [
              "Nhân viên",
              "Hoa hồng bán hàng",
              "Hoa hồng dịch vụ",
              "Thưởng thêm"
            ],
            data: [
              ["TC - Huy", "1,050,000", "250,000", "300,00"],
              ["TC - Trang", "650,000", "80,000", "500,00"],
              ["TC - Huyền", "500,000", "100,000", "50,000"],
              ["TC - Thông", "450,000", "50,000", "20,000"],
              ["TC - Ngọc", "300,000", "10,000", "40,000"],
              ["Tổng", "2,850,000", "650,000", "500,00"],
            ],
          ),
          DataTableCustom(
            colorsData: [ThemeColor.dodgerBlue, ThemeColor.dark],
            dataFistRow: [
              "Nhân Viên",
              "Số Lượt Dịch Vụ",
              "Giá Trị  dịch Vụ",
              "Nhóm"
            ],
            data: [
              ["TC - Huy", "6", "250,000", "KTV"],
              ["TC - Trang", "6", "80,000", "TC"],
              ["TC - Huyền", "6", "100,000", "KTV"],
              ["TC - Thông", "6", "50,000", "KTV"],
              ["TC - Ngọc", "6", "10,000", "TP"],
            ],
          ),
          DataTableCustom(
            paddingTable: LayoutSize.none,
            dataFistRow: ["Giờ", "Lượng Khách", "Doanh Thu"],
            divideByPercent: [0.2,0.4,0.4],
            data: [
              ["00:00", "12", "12,500,000"],
              ["01:00", "12", "1,500,000"],
              ["02:00", "12", "6,500,000"],
              ["03:00", "12", "2,500,000"],
              ["04:00", "12", "0"],
              ["05:00", "12", "0"],
            ],
          ),
          DataTableCustom(
            customTop: Button(
              iconLeft: LineIcons.chevron_down,
              contentCustom: Container(
                child: Text("Danh Sách"),
              ),
              color: ThemeColor.lightest,
              textColor: ThemeColor.dark,
            ),
            paddingTable: LayoutSize.tiny,
            divideByPercent: [0.15,0.35,0.2,0.2],
            dataFistRow: ["Loại P", "Ngày   a", "Mã Phiếu", "Người Nhận"],
            data: [
              ["Thu", "06/07/2021", "HD000123", "Minh"],
              ["Thu", "06/07/2021", "HD000123", "Minh"],
              ["Thu", "06/07/2021", "HD000123", "Ngọc"],
              ["Chi", "06/07/2021", "HD000234", "Ngọc"],
              ["Chi", "06/07/2021", "HD000135", "Minh"],
              ["Thu", "06/07/2021", "HD000114", "Ngọc"],
              ["Thu", "06/07/2021", "HD000897", "Minh"],
            ],
          ),
          DataTableCustom(
            borderRadius: LayoutSize.none,
            marginTable: LayoutSize.none,
            paddingTable: LayoutSize.none,
            divideByPercent: [0.25,0.2,0.2,0.35],
            dataFistRow: ["Tên Nhân Viên", "Thưởng", "Phạt", "Lựa Chọn"],
            data: [
              [
                "TC - Huy",
                "80,000",
                "250,000",
                ButtonGroup(
                  expanded: true,
                  vertical: true,
                  children: [
                    ButtonGroup(
                      children: [
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.calendar_never,
                          color: ThemeColor.secondary,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.money_stack,
                          color: ThemeColor.darkOrange,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.credit_card,
                        ),
                      ],
                    )
                  ],
                )
              ],
              [
                "TC - Trang",
                "80,000",
                "80,000",
                ButtonGroup(
                  expanded: true,
                  vertical: true,
                  children: [
                    ButtonGroup(
                      children: [
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.calendar_never,
                          color: ThemeColor.secondary,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.money_stack,
                          color: ThemeColor.darkOrange,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.credit_card,
                        ),
                      ],
                    )
                  ],
                )
              ],
              [
                "TC - Huyền",
                "80,000",
                "100,000",
                ButtonGroup(
                  expanded: true,
                  vertical: true,
                  children: [
                    ButtonGroup(
                      children: [
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.calendar_never,
                          color: ThemeColor.secondary,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.money_stack,
                          color: ThemeColor.darkOrange,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.credit_card,
                        ),
                      ],
                    )
                  ],
                )
              ],
              [
                "TC - Thông",
                "80,000",
                "50,000",
                ButtonGroup(
                  expanded: true,
                  vertical: true,
                  children: [
                    ButtonGroup(
                      children: [
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.calendar_never,
                          color: ThemeColor.secondary,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.money_stack,
                          color: ThemeColor.darkOrange,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.credit_card,
                        ),
                      ],
                    )
                  ],
                )
              ],
              [
                "TC - Ngọc",
                "80,000",
                "10,000",
                ButtonGroup(
                  expanded: true,
                  vertical: true,
                  children: [
                    ButtonGroup(
                      children: [
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.calendar_never,
                          color: ThemeColor.secondary,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.money_stack,
                          color: ThemeColor.darkOrange,
                        ),
                        Button(
                          buttonIconSize: LayoutSize.small,
                          iconSize: LayoutSize.small,
                          paddingButton: LayoutSize.none,
                          icon: LineIcons.credit_card,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ],
          ),
          SizedBox(height: 10,),
          DataTableCustom(
            borderRadius: LayoutSize.none,
            marginTable: LayoutSize.none,
            paddingTable: LayoutSize.none,
            divideByPercent: [0.5,0.15,0.35],
            dataFistRow: ["Tên Sản Phẩm", "Cuối kì", "LỊch Sử Nhập Xuất"],
            data: [
              [
                "Dầu xã khô dưỡng ẩm SP 1...",
                "8",
                Button(content: "Xem",paddingButton: LayoutSize.none)
              ],
              [
                "Xịt dưỡng giữ màu Loreal 4...",
                "8",
                Button(content: "Xem",paddingButton: LayoutSize.none,)
              ],
              [
                "Xịt dưỡng GoldWell 15ml",
                "5",
                Button(content: "Xem",paddingButton: LayoutSize.none,)
              ],
              [
                "Dầu xã khô dưỡng ẩm SP 1...",
                "8",
                Button(content: "Xem",paddingButton: LayoutSize.none,)
              ],
            ],
          ),
        ]);
  }
}
