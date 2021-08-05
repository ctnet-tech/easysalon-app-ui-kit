import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button_group.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/profile_admin.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:easysalon_mobile_ui_kit/widgets/typography/paragraph.dart';
import 'package:flutter/widgets.dart';

class ProfileAdminPage extends StatelessWidget {
  static const String path = '/pages/widgets/profile_admin_page';

  const ProfileAdminPage({Key? key}) : super(key: key);

  _profileAdmin(){
    return ProfileAdmin(
      roleText: 'Admin',
      emailText: "nhatnam1121@example.com",
      avatarUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS54088iJjHpn-y9FCxGAh5NBEdHugwIXewWQ&usqp=CAU",
      nameText: "Phan Nhật Nam",
      onTapIconAdd: () {
        print("add");
      },
      onTapIconEdit: () {
        print("edit");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Profile Admin", description: "To trigger an operation."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
                SpaceBox(
                    size: LayoutSize.big, bottom: true, child: _profileAdmin()),
              ]))
        ]);
  }
}
