import 'package:easysalon_mobile_ui_kit/widgets/basic/custom_textfield.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPage extends StatelessWidget {
  static const String path = '/pages/widgets/custom_textfield_page';

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "TextField", description: "To trigger an operation."),
        children: [
          SpaceBox(
            all: true,
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                CustomTextField(
                  textEditingController: TextEditingController(),
                  hintText: "Email hoặc số điện thoại",
                ),
                CustomTextField(
                  textEditingController: TextEditingController(),
                  hasObscureText: true,
                  hintText: "Mật khẩu",
                ),
                CustomTextField(
                  firstText: "Họ và tên",
                  textEditingController: TextEditingController(),
                ),
                CustomTextField(
                  firstText: "Điện thoại",
                  textEditingController: TextEditingController(),
                  isOnlyNumber: true,
                ),
                CustomTextField(
                  firstText: "Điện thoại",
                  secondText: "Đổi mật khẩu",
                  onTapSecondText: () {
                    print("onTapSecondText");
                  },
                  textEditingController: TextEditingController(),
                  hasObscureText: true,
                ),
                CustomTextField(
                  firstText: "Ngày sinh",
                  textEditingController: TextEditingController(),
                  isDatePicker: true,
                ),
                CustomTextField(
                  firstText: "Ghi chú",
                  textEditingController: TextEditingController(),
                  hintText: "Nhập ghi chú",
                  minLine: 6,
                ),
              ],
            ),
          ),
        ]);
  }
}
