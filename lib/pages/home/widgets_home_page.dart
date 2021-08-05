import 'package:easysalon_mobile_ui_kit/bloc/customer_services_bloc/customer_services_bloc.dart';
import 'package:easysalon_mobile_ui_kit/bloc/customer_services_bloc/customer_services_blocs.dart';
import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/add_customer_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/appointment_schedule_panel_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/assignment_of_duties_tag_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/buttom_sheet_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/expandable_button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/chart_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/data_table_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/date_time_selector_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/custom_textfield_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/customer_service_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/custom_tab_bar_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/invoice_test_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/profile_admin_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/report_panel_page.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/expandable_button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/date_range_picker/date_range_picker.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/deposit_bottom_sheet.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/filter_bottom_sheet.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/customer_services.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/selection_time_bar.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/successful_appointment_dialog.dart';
import 'package:easysalon_mobile_ui_kit/widgets/icons/CustomIcon.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu.dart';
import 'package:easysalon_mobile_ui_kit/widgets/navigation/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      MenuItem(label: "Add customer Page",to: AddCustomerPage.path),
                      MenuItem(label: "ExpandableButton", to: ExpandableButtonPage.path),
                      MenuItem(label: "Profile Admin",to: ProfileAdminPage.path ,),
                      MenuItem(label: "DateTimeSelector", to: DateTimeSelectorPage.path),
                      MenuItem(label: "ReportPanel", to: ReportPanelPage.path),
                      MenuItem(label: "BottomSheet", to: BottomSheetPage.path),
                      MenuItem(label: "CustomTextField", to: CustomTextFieldPage.path),
                      MenuItem(label: "CustomerService", to: CustomerServicePage.path),
                      MenuItem(label: "CustomTabBar",to: CustomTabBarPage.path,)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => SuccessfulAppointmentDialog(
                                    onTapNavigator: () {
                                      print("onTap");
                                    },
                                  ));
                        },
                        child: Text("show dialog")),
                  ),
                ],
              )))
    ]);
  }
}
