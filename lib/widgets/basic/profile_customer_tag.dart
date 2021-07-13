import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:easysalon_mobile_ui_kit/widgets/basic/button.dart';
import 'package:easysalon_mobile_ui_kit/widgets/layout/divider.dart'
as dividerCustom;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCustomerTag extends StatelessWidget {
  const ProfileCustomerTag({
    Key? key,
    this.color = ThemeColor.bondiBlue,
    this.hintTextColor = ThemeColor.secondary,
    this.textColor = ThemeColor.dark,
    this.textIdColor = ThemeColor.bondiBlue,
    this.imageAvatar,
    this.sizeAvatar = LayoutSize.bigest,
    this.sizeBorderRadiusAvatar = LayoutSize.small,
    this.nameCustomer = "Name Customer",
    this.typeCustomer = "[Type Customer]",
    this.idCustomer = "T00012",
    this.fontSizeTextTypeCustomer = LayoutSize.medium,
    this.fontSizeTextButton = LayoutSize.small,
    this.fontSizeTextName = LayoutSize.large,
    this.dayTimeCreateCustomerContent,
    this.phoneNumberCustomerText = "Số Điện Thoại: ",
    this.dayTimeCreateCustomerText = "Ngày Khởi Tạo: ",
    this.userCreateCustomerContent,
    this.userCreateCustomerText = "Người Khởi Tạo: ",
    this.fontSizeTextPhoneNumberCustomer = LayoutSize.medium,
    this.fontSizeTextDayTimeCreateCustomer = LayoutSize.medium,
    this.fontSizeTextUserCreateCustomer = LayoutSize.medium,
    this.iconButton,
    this.phoneNumberCustomerContent,
    required this.totalSpendingContent,
    required this.totalPaidContent,
    required this.totalDebitContent,
    this.totalSpendingHintCustom = "Tổng Chi Tiêu",
    this.totalPaidHintCustom = "Đã Thanh Toán",
    this.totalDebitHintCustom = "Còn Nợ",
    this.fontSizeTextBottomCustom = LayoutSize.medium,
    this.onPressedButton,
    this.contentButton = "Tặng Khuyến Mãi",
  }) : super(key: key);
  final ThemeColor color;
  final ThemeColor hintTextColor;
  final ThemeColor textColor;
  final ThemeColor textIdColor;
  final LayoutSize fontSizeTextName;
  final Image? imageAvatar;
  final LayoutSize sizeAvatar;
  final LayoutSize sizeBorderRadiusAvatar;
  final String nameCustomer;
  final String typeCustomer;
  final String idCustomer;
  final LayoutSize fontSizeTextTypeCustomer;
  final LayoutSize fontSizeTextButton;
  final IconData? iconButton;
  final String? phoneNumberCustomerContent;
  final String? dayTimeCreateCustomerContent;
  final String? userCreateCustomerContent;
  final String phoneNumberCustomerText;
  final String dayTimeCreateCustomerText;
  final String userCreateCustomerText;
  final LayoutSize fontSizeTextPhoneNumberCustomer;
  final LayoutSize fontSizeTextDayTimeCreateCustomer;
  final LayoutSize fontSizeTextUserCreateCustomer;
  final String totalSpendingContent;
  final String totalPaidContent;
  final String totalDebitContent;
  final String totalSpendingHintCustom;
  final String totalPaidHintCustom;
  final String totalDebitHintCustom;
  final LayoutSize fontSizeTextBottomCustom;
  final VoidCallback? onPressedButton;
  final String contentButton;

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var textColorAll = theme.getColor(textColor);
    var textHintColorAll = theme.getColor(hintTextColor);
    var _textIdColor = theme.getColor(textIdColor);
    var buttonHasIcon = iconButton != null;
    var sizeAvatar = layout.sizeToShapeSize(this.sizeAvatar);
    var sizeBorderRadiusAvatar =
    layout.sizeToBorderRadius(this.sizeBorderRadiusAvatar);

    var nameTagCustomer = Text(
      nameCustomer,
      style: TextStyle(
          color: textColorAll,
          fontSize: layout.sizeToFontSize(fontSizeTextName)),
    );
    var typeOfCustomer = Text(
      typeCustomer,
      style: TextStyle(
          color: textHintColorAll,
          fontSize: layout.sizeToFontSize(fontSizeTextTypeCustomer)),
    );
    var idOfCustomer = Text(
      idCustomer,
      style: TextStyle(
          color: _textIdColor,
          fontSize: layout.sizeToFontSize(fontSizeTextTypeCustomer)),
    );
    var isHasAvatar = imageAvatar != null;
    var leftWidget = Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: sizeAvatar,
              child: ClipRRect(
                  borderRadius: sizeBorderRadiusAvatar,
                  //add border radius here
                  child: isHasAvatar ? imageAvatar : Icon(LineIcons.user)),
            ),
            Flexible(
              child: Container(
                padding:
                EdgeInsets.only(left: layout.sizeToPadding(LayoutSize.tiny)),
                height: sizeAvatar,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [nameTagCustomer, typeOfCustomer, idOfCustomer],
                ),
              ),
            )
          ],
        ));
    var helfButtonWidget = Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: sizeAvatar,
              child: ClipRRect(
                  borderRadius: sizeBorderRadiusAvatar,
                  //add border radius here
                  child: Image.network(
                      "https://i.pinimg.com/280x280_RS/c6/e4/a9/c6e4a9fc80594486711b42026f5d21f8.jpg")),
            ),
            Container(
              height: sizeAvatar,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [typeOfCustomer, idOfCustomer],
              ),
            )
          ],
        ));
    _onPressed() {}
    var mainTopWidget = Stack(
      children: [
        Container(
          width: double.infinity,
        ),
        leftWidget,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
              child: helfButtonWidget,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: false,
            ),
            SizedBox(
              width: layout.sizeToShapeSize(LayoutSize.small),
            ),
            Flexible(
                child: buttonHasIcon
                    ? Button(
                  onPressed: this.onPressedButton ?? _onPressed,
                  outlined: true,
                  color: ThemeColor.secondary,
                  icon: iconButton,
                  content: contentButton,
                  fontSizeText: fontSizeTextButton,
                  solid: false,
                )
                    : Button(
                  onPressed: this.onPressedButton ?? _onPressed,
                  outlined: true,
                  color: ThemeColor.secondary,
                  content: contentButton,
                  fontSizeText: fontSizeTextButton,
                  solid: false,
                )),
          ],
        )
      ],
    );
    var contentPhoneNumber = RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  style: TextStyle(
                      color: textHintColorAll,
                      fontSize: layout
                          .sizeToFontSize(this.fontSizeTextPhoneNumberCustomer)),
                  text: this.phoneNumberCustomerText),
              TextSpan(
                  style: TextStyle(
                      color: textColorAll,
                      fontSize: layout
                          .sizeToFontSize(this.fontSizeTextPhoneNumberCustomer)),
                  text: this.phoneNumberCustomerContent),
            ]));
    var contentDateCreate = RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  style: TextStyle(
                      color: textHintColorAll,
                      fontSize: layout
                          .sizeToFontSize(this.fontSizeTextPhoneNumberCustomer)),
                  text: this.dayTimeCreateCustomerText),
              TextSpan(
                  style: TextStyle(
                      color: textColorAll,
                      fontSize: layout
                          .sizeToFontSize(this.fontSizeTextPhoneNumberCustomer)),
                  text: this.dayTimeCreateCustomerContent),
            ]));
    var userCreate = RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  style: TextStyle(
                      color: textHintColorAll,
                      fontSize: layout
                          .sizeToFontSize(this.fontSizeTextPhoneNumberCustomer)),
                  text: this.userCreateCustomerText),
              TextSpan(
                  style: TextStyle(
                      color: textColorAll,
                      fontSize: layout
                          .sizeToFontSize(this.fontSizeTextPhoneNumberCustomer)),
                  text: this.userCreateCustomerContent),
            ]));
    var _dividerWidget = dividerCustom.Divider(
        isHorizontal: false,
        customHeight: layout.sizeToShapeSize(LayoutSize.small),
        color: ThemeColor.pattensBlue);
    var _columnTag = (
        {colorTextTop,
          colorTextBottom,
          contentTextTop,
          contentTextBottom}) =>
        Padding(
          padding: EdgeInsets.all(layout.sizeToPadding(LayoutSize.small)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: layout.sizeToPadding(LayoutSize.small)),
                child: Text(
                  contentTextTop,
                  style: TextStyle(
                      color: colorTextTop,
                      fontSize:
                      layout.sizeToFontSize(fontSizeTextBottomCustom)),
                ),
              ),
              Text(
                contentTextBottom,
                style: TextStyle(
                    color: colorTextBottom,
                    fontSize: layout.sizeToFontSize(fontSizeTextBottomCustom)),
              ),
            ],
          ),
        );
    var mainWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainTopWidget,
        SizedBox(
          height: 20,
        ),
        contentPhoneNumber,
        contentDateCreate,
        userCreate,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _columnTag(
                colorTextBottom: textColorAll,
                colorTextTop: textHintColorAll,
                contentTextBottom: this.totalSpendingContent,
                contentTextTop: this.totalSpendingHintCustom),
            _dividerWidget,
            _columnTag(
                colorTextBottom: textColorAll,
                colorTextTop: textHintColorAll,
                contentTextBottom: this.totalPaidContent,
                contentTextTop: this.totalPaidHintCustom),
            _dividerWidget,
            _columnTag(
                colorTextBottom: theme.getColor(ThemeColor.radicalRed),
                colorTextTop: textHintColorAll,
                contentTextBottom: this.totalDebitContent,
                contentTextTop: this.totalDebitHintCustom),
          ],
        )
      ],
    );

    return mainWidget;
  }
}