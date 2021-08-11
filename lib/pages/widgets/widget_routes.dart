import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/add_customer_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/appointment_schedule_panel_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/assignment_of_duties_tag_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/buttom_sheet_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/chart_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/data_table_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/expandable_button_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/date_time_selector_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/custom_textfield_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/customer_service_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/custom_tab_bar_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/header_bar_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/icon_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/invoice_test_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/paragraph_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/profile_admin_page.dart';
import 'package:easysalon_mobile_ui_kit/pages/widgets/generic/report_panel_page.dart';

var widgetRoutes = {
  ParagraphPage.path: () => ParagraphPage(),
  ButtonPage.path: () => ButtonPage(),
  IconPage.path: () => IconPage(),
  ChartPage.path: () => ChartPage(),
  DataTablePage.path: () => DataTablePage(),
  AppointmentSchedulePanelPage.path: () => AppointmentSchedulePanelPage(),
  AssignmentOfDutiesTagPage.path: () => AssignmentOfDutiesTagPage(),
  InvoiceTestPage.path: () => InvoiceTestPage(),
  AddCustomerPage.path:() => AddCustomerPage(),
  ExpandableButtonPage.path: () => ExpandableButtonPage(),
  ProfileAdminPage.path: () => ProfileAdminPage(),
  DateTimeSelectorPage.path: () => DateTimeSelectorPage(),
  ReportPanelPage.path: () => ReportPanelPage(),
  BottomSheetPage.path: () => BottomSheetPage(),
  CustomTextFieldPage.path: () => CustomTextFieldPage(),
  CustomerServicePage.path: () => CustomerServicePage(),
  CustomTabBarPage.path: () => CustomTabBarPage(),
  HeaderBarPage.path: () => HeaderBarPage(),
};
