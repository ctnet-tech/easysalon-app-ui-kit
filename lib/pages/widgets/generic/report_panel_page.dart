import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/report_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';

class ReportPanelPage extends StatelessWidget {
  static const String path = '/pages/widgets/report_panel_page';

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "ReportPanel", description: "all types customReportPanel"),
        children: [
          Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                child: Column(
                  children: [
                    // Báo cáo doanh thu Hóa Đơn
                    ReportGroupPanel(reportData: fakeDataType1,
                        icons: [
                          LineIcons.collapse_down,
                          LineIcons.money_bill,
                          LineIcons.attach_document,
                          LineIcons.bill
                        ],
                        count: 4,
                        type: 1),
                    SizedBox(
                      height: 20,
                    ),
                    //Báo cáo doanh thu Phương thức thanh toán
                    ReportGroupPanel(reportData: fakeDataType2,
                        icons: [
                      LineIcons.money_bill,
                      LineIcons.duplicate_alt,
                      LineIcons.attach_document,
                      LineIcons.credit_card
                    ], count: 4, type: 2),
                    SizedBox(
                      height: 20,
                    ),
                    //Báo cáo thu chi
                    ReportGroupPanel(reportData: fakeDataType3,icons: [
                      LineIcons.money_bill,
                      LineIcons.duplicate_alt,
                      LineIcons.attach_document,
                      LineIcons.credit_card
                    ], count: 4, type: 3),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
        ]);
  }
}


List<ReportData> fakeDataType1 = [
  new ReportData("Doanh thu", "Hôm nay", "9,900,000", "1,200,000", false),
  new ReportData("Đã thanh toán", "Hôm nay", "9,900,000", "1,200,000", false),
  new ReportData("Nợ", "Hôm nay", "9,900,000", "1,200,000", true),
  new ReportData("Số lượng hóa đơn", "Hôm nay", "9,900,000", "1,200,000", false),
];
List<ReportData> fakeDataType2 = [
  new ReportData("Tiền mặt",null ,"16,000,000", null, false),
  new ReportData("Chuyển khoản",null, "5,500,000", null, false),
  new ReportData("Ghi nợ",null, "4,000,000", null, false),
  new ReportData("Thẻ tài khoản ", null, "12,500,000", null, false),
];
List<ReportData> fakeDataType3 =[
  new ReportData("Nhập kho",null ,"500", null, false),
  new ReportData("Xuất kho",null, "247", null, false),
  new ReportData("Tồn kho",null, "1,673", null, false),
  new ReportData("Giá trị tồn kho", null, "12,380,000", null, false),
];