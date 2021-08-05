import 'package:easysalon_mobile_ui_kit/widgets/basic/expandable_button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/page_header.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/space.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/standard_page.dart';
import 'package:flutter/widgets.dart';

class ExpandableButtonPage extends StatelessWidget {
  static const String path = '/pages/widgets/expandable_button_page';

  const ExpandableButtonPage({Key? key}) : super(key: key);

 _expandableButton(){
   return  ExpandableButton(
     onChanged: (values) { print(values);},
     data: <String, List<String>>{
       "key1": ["Đánh thức giác quan với thảo dược", "150,000đ"],
       "key2": ["Chăm sóc thảo dược, đá nóng", "200,000đ"],
       "key3": ["Giảm đau nhức cơ với thảo dược", "250,000đ"],
     },
     text: "HERBAL SPA FOOD &amp; NAIL CARE",
   );
 }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
        header: PageHeader(
            title: "Button", description: "To trigger an operation."),
        children: [
          SpaceBox(
              all: true,
              child: Column(children: [
               _expandableButton()
              ]))
        ]);
  }
}
