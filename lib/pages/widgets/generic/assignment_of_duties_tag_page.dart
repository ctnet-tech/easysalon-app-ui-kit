import 'package:easysalon_mobile_ui_kit/widgets/basic/appointment_schedule_panel.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/assignment_of_duties_tag.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';

import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AssignmentOfDutiesTagPage extends StatefulWidget {
  static const String path = '/pages/widgets/assignment_of_duties_tag_page';

  const AssignmentOfDutiesTagPage({Key? key}) : super(key: key);

  @override
  _AssignmentOfDutiesTagPageState createState() =>
      _AssignmentOfDutiesTagPageState();
}

class _AssignmentOfDutiesTagPageState extends State<AssignmentOfDutiesTagPage> {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Assignment Of Duties Tag",
            description: "To trigger an operatioan."),
        children: [
          AssignmentOfDutiesTag(
            commissionIsDropDown: false,
            dataFist: [
              ['', '', ''],
              ['', '', '']
            ],
            dataDropStaff: {
              '': 'Nhập Hoạc Chọn Nhân Viên',
              'nv01': 'TC - Tâm',
              'nv04': 'TC - Trang',
              'nv03': 'TC - Huyền',
              'nv02': 'TC - Thông',

            },
            dataDropCommission: {
              'hh1': 'Hoa Hồng Tùy Chỉnh',
              'hh2': 'Hoa Hồng Theo Phần Trăm',
             'hh4': 'Hoa Hồng Tùy Chỉnh',
              'hh5': 'Hoa Hồng Theo Phần Trăm'
            },
            onChanged: (data) {
              print("${data}___của 1");
            },
          ),
          AssignmentOfDutiesTag(
            dataFist: [
              ['', '', ''],
              ['', '', '']
            ],
            dataDropStaff: {
              '': 'Nhập Hoạc Chọn Nhân Viên',
              'nv01': 'TC - Tâm',
              'nv04': 'TC - Trang',
              'nv03': 'TC - Huyền',
              'nv02': 'TC - Thông',

            },
            dataDropCommission: {
              'hh1': 'Hoa Hồng Tùy Chỉnh',
              'hh2': 'Hoa Hồng Theo Phần Trăm',
              'hh4': 'Hoa Hồng Tùy Chỉnh',
              'hh5': 'Hoa Hồng Theo Phần Trăm'
            },
            onChanged: (data) {
              print("${data}___của 1");
            },
          )
        ]);
  }
}
