import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_service_list_title.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_slidable_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/drop_down_field.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/find_branch_table.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/form_add_customer.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/invoice_status_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/menu_top_bar_custom.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/notification_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/service_pack_infomation_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
as dividerCustom;
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCustomerPage extends StatefulWidget {
  static const String path = '/pages/widgets/add_customer_page';

  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  _AddCustomerPageState createState() =>
      _AddCustomerPageState();
}

class _AddCustomerPageState
    extends State<AddCustomerPage> {


  @override
  Widget build(BuildContext context) {
    return StandardPage(

        header: MenuTopBarCustom(
          onChanged: (a) {},
          titleButtons: ["Chưa Thanh Toán", "Đã thanh toán", "Tất Cả"],
        ),
        children: [
          FormAddCustomer()

        ]);
  }
}
