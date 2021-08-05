import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/add_customer_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/appointment_schedule_panel_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/assignment_of_duties_tag_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/chart_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/data_table_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/invoice_test_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu_item.dart';
import 'package:flutter/widgets.dart';

class WidgetsHomePage extends StatefulWidget {
  WidgetsHomePage() : super(key: Key("HOME"));
  @override
  _WidgetsHomePageState createState() => _WidgetsHomePageState();
}

class _WidgetsHomePageState extends State<WidgetsHomePage> {
  @override
  Widget build(BuildContext context) {
    return StandardPage(header: PageHeader(title: "Widget"), children: [
      Panel(
          shadow: false,
          color: ThemeColor.weak,
          child: SpaceBox(
              all: true,
              child: Column(
                children: [
                  Menu(
                    label: "Basic",
                    children: [
                      MenuItem(label: "Paragraph", to: ParagraphPage.path),
                      MenuItem(label: "Button", to: ButtonPage.path),
                      MenuItem(label: "Icon", to: IconPage.path),
                      MenuItem(label: "chart",to: ChartPage.path),
                      MenuItem(label: "data table",to: DataTablePage.path),
                      MenuItem(label: "Appointment Schedule Panel",to: AppointmentSchedulePanelPage.path),
                      MenuItem(label: "Assignment Of Duties Tag",to: AssignmentOfDutiesTagPage.path),
                      MenuItem(label: "Invoice Test Page",to: InvoiceTestPage.path),
                      MenuItem(label: "Add customer Page",to: AddCustomerPage.path)
                    ],
                  )
                ],
              )))
    ]);
  }
}
