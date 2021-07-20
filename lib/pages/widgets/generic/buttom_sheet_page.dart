import 'package:easysalon_mobile_ui_kit/widgets/basic/deposit_bottom_sheet.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomSheetPage extends StatelessWidget {
  static const String path = '/pages/widgets/bottom_sheet_page';

  const BottomSheetPage({Key? key}) : super(key: key);
  _depositBottomSheet(BuildContext context){
    return Center(
      child: InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              context: context,
              builder: (_) => DepositBottomSheet(
                listPaymentMethodInput: [["data1","100000","account1"],["data2",null,null],["data2",null,"account3"]],
                dropdownDataMethodPayment: <String, String>{
                  "data1": "Tiền mặt",
                  "data2": "Chuyển khoản",
                  "data3": "Điểm",
                },
                dropdownDataBankAccounts: <String, String>{
                  "account1": "Tài khoản 1",
                  "account2": "Tài khoản 2",
                  "account3": "Tài khoản 3",
                },
                height:
                MediaQuery.of(context).size.height * 2 / 3,
                onChanged: (value) {
                  print(value);
                },
              ),
            );
          },
          child: Text("Show DepositBottomSheet")),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StandardPage(
      header:
          PageHeader(title: "Button", description: "To trigger an operation."),
      children: [
        SpaceBox(
          all: true,
          child: Column(
            children: [
              _depositBottomSheet(context),
            ],
          ),
        ),
      ],
    );
  }
}
