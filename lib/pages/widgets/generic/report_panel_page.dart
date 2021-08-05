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
                    ReportGroupPanel(
                        reportData: fakeDataType1,
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
                    ReportGroupPanel(
                        reportData: fakeDataType2,
                        icons: [
                          LineIcons.money_bill,
                          LineIcons.duplicate_alt,
                          LineIcons.attach_document,
                          LineIcons.credit_card
                        ],
                        count: 4,
                        type: 2),
                    SizedBox(
                      height: 20,
                    ),
                    //Báo cáo thu chi
                    ReportGroupPanel(
                        reportData: fakeDataType3,
                        icons: [
                          LineIcons.collapse_down,
                          LineIcons.arrow_to_top,
                          LineIcons.activity,
                          LineIcons.dollar_sign,
                        ],
                        count: 4,
                        type: 3),
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
  new ReportData(
      firstTopText: "Doanh thu",
      secondTopText: "Hôm nay",
      middleText: "9,900,000",
      bottomText: "1,200,000",
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Đã thanh toán",
      secondTopText: "Hôm nay",
      middleText: "9,900,000",
      bottomText: "1,200,000",
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Nợ",
      secondTopText: "Hôm nay",
      middleText: "9,900,000",
      bottomText: "1,200,000",
      isRedBottomText: true),
  new ReportData(
      firstTopText: "Số lượng hóa đơn",
      secondTopText: "Hôm nay",
      middleText: "9,900,000",
      bottomText: "1,200,000",
      isRedBottomText: false),
];
List<ReportData> fakeDataType2 = [
  new ReportData(
      firstTopText: "Tiền mặt",
      secondTopText: null,
      middleText: "16,000,000",
      bottomText: null,
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Chuyển khoản",
      secondTopText: null,
      middleText: "5,500,000",
      bottomText: null,
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Ghi nợ",
      secondTopText: null,
      middleText: "4,000,000",
      bottomText: null,
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Thẻ tài khoản ",
      secondTopText: null,
      middleText: "12,500,000",
      bottomText: null,
      isRedBottomText: false),
];
List<ReportData> fakeDataType3 = [
  new ReportData(
      firstTopText: "Nhập kho",
      secondTopText: null,
      middleText: "500",
      bottomText: null,
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Xuất kho",
      secondTopText: null,
      middleText: "247",
      bottomText: null,
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Tồn kho",
      secondTopText: null,
      middleText: "1,673",
      bottomText: null,
      isRedBottomText: false),
  new ReportData(
      firstTopText: "Giá trị tồn kho",
      secondTopText: null,
      middleText: "12,380,000",
      bottomText: null,
      isRedBottomText: false),
];
