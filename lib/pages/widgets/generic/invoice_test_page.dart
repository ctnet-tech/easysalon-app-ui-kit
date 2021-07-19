import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/add_image_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/data_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/list_service_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/menu_bar_custom.dart';
import 'package:provider/provider.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/tag_title_top_invoice.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InvoiceTestPage extends StatefulWidget {
  static const String path = '/pages/widgets/invoice_test_page';

  const InvoiceTestPage({Key? key}) : super(key: key);

  @override
  _InvoiceTestPageState createState() => _InvoiceTestPageState();
}

class _InvoiceTestPageState extends State<InvoiceTestPage> {
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    return StandardPage(
        header: SafeArea(
          child: TagTitleTopInvoice(
            onChangedDrop: (keyDrop) {
              print("chon $keyDrop");
            },
            dataDrop: {"g1": "ghế 1", "g2": "ghế 2"},
            customer: Text(
              "[Khách mới] Bảo An",
              style: TextStyle(
                fontSize: layout.sizeToFontSize(LayoutSize.medium),
                color: theme.getColor(ThemeColor.bondiBlue),
              ),
            ),
            phone: "0908123456",
            time: "09:36 01/10/2020",
          ),
        ),
        children: [
          ListServiceTable(
            listServiceWidget: [
              ListServiceTag(
                priceChange: (price){
                  print("price : $price");
                },
                listAccompaniedService: [
                  AccompaniedServiceTag(
                    nameOfService: 'Dầy gội súnulk : ',
                    onChangeInput: (txt) {
                      print(txt);
                    },
                  ),
                  AccompaniedServiceTag(
                    nameOfService: 'Dầu sả : ',
                    onChangeInput: (txt) {
                      print(txt);
                    },
                  ),
                ],
                onPressedDelete: () {
                  print("delete_1");
                },
                canEditPrice: true,
                onChanged: (data) {
                  print("data1 ${data}");
                },
                serviceName: "Đính hạt đơn giản 2 viên(1 ngón)",
                staff: "TC - Ngân",
                totalOfInvoice: 120000,
              ),
              ListServiceTag(
                onPressedDelete: () {
                  print("delete_2");
                },
                onChanged: (data) {
                  print("data1 ${data}");
                },
                serviceName: "Chăm sóc da mặt cơ bản",
                staff: "KTV - Tú, TP - Tuấn, TP - Nhung",
                totalOfInvoice: 450000,
              )
            ],
          ),
          AddImageTable(
            onChanged: (listImagePicker) {
              listImagePicker.map((e) {
                print(e.path);
              }).toList();
            },
          ),
          MenuBarCustom(
            height: 500,
            listContent: [
              StandardPage(children: [
                DataTableCustom(
                  divideByPercent: [0.3,0.3,0.4],
                  paddingTable: LayoutSize.none,
                  dataFistRow: ["Ngày Nghỉ", "Lý Do", "Nghỉ có xin Phép"],
                  data: [
                    ["11/11/2020", "Có Việc Bận", "Có xin phép"],
                    ["11/11/2020", "Cảm cúm", "Có xin phép"],
                    ["11/11/2020",'' , Button(
                      fontSizeText: LayoutSize.medium,
                color: ThemeColor.radicalRed,
                content: "Không Xin Phép",
                onPressed: (){},
                  matteCoating: true,
                ),],

                  ],
                ),
              ],header: Container(),),
              StandardPage(children: [],header: Container(),),
              StandardPage(children: [],header: Container(),)
            ],
            listTitle: ["Ngày nghỉ", "Thưởng/phạt", "Thanh toán"],
          )
        ]);
  }
}
