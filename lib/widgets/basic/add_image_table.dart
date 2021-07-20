import 'dart:io';

import 'package:easysalon_mobile_ui_kit/configs/icons/line_icons.dart';
import 'package:easysalon_mobile_ui_kit/services/layout_notifier.dart';
import 'package:easysalon_mobile_ui_kit/services/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddImageTable extends StatefulWidget {
  AddImageTable({
    Key? key,
    this.borderRadius = LayoutSize.none,
    this.colorTable = ThemeColor.lightest,
    this.paddingTable = LayoutSize.small,
    this.marginTable = LayoutSize.none,required this.onChanged, this.listImageFistTime ,
  }) : super(key: key);
  final LayoutSize borderRadius;
  final ThemeColor colorTable;
  final LayoutSize paddingTable;
  final LayoutSize marginTable;
  final ValueChanged<List<PickedFile>> onChanged;
  final List<PickedFile>? listImageFistTime;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddImageTableState();
  }
}

class _AddImageTableState extends State<AddImageTable> {
  ImagePicker _picker = ImagePicker();
  List<PickedFile> listImage = [];
  void pickerImage() async {
    PickedFile imageGet =  (await _picker.getImage(source: ImageSource.camera))!;
    if(imageGet != null){
      setState(() {
        listImage.add(imageGet);
        widget.onChanged(listImage);
      });
    }
  }
  @override
  void initState() {

    super.initState();
    listImage = widget.listImageFistTime ?? [];
  }
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeNotifier>().getTheme();
    var layout = context.read<LayoutNotifier>();
    var radius = layout.sizeToBorderRadius(widget.borderRadius);
    final List fixedListImage =
    Iterable<int>.generate(listImage.length).toList();
    var imageTag = ({required image,required index}) {
      File fileImage = File(image.path);
      return  GridTile(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.file(fileImage,fit: BoxFit.cover),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(
                      layout.sizeToPadding(LayoutSize.tiny)),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        listImage.removeAt(index);
                        widget.onChanged(listImage);
                      });

                    },
                    child: CircleAvatar(
                      backgroundColor: theme.getColor(ThemeColor.lightest).withOpacity(0.3),
                      maxRadius: 13,
                      child: Icon(
                        LineIcons.close,
                        color: theme.getColor(ThemeColor.radicalRed),
                        size: layout.sizeToIconSize(LayoutSize.small),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ));
    };


    return Container(
      height: 250,
      padding: EdgeInsets.all(layout.sizeToPadding(widget.paddingTable)),
      margin: EdgeInsets.all(layout.sizeToPadding(widget.marginTable)),
      decoration: BoxDecoration(
        borderRadius: radius,
        color: theme.getColor(widget.colorTable),
      ),
      child: LayoutBuilder(
        builder: (context, containers) {
          return Column(
            children: [
              Container(
                height: containers.maxHeight * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ảnh tải lên",
                      style: TextStyle(
                          color: theme.getColor(ThemeColor.secondary),
                          fontSize: layout.sizeToFontSize(LayoutSize.medium)),
                    ),
                    InkWell(
                      onTap: () {
                        // nút thêm ảnh
                        pickerImage();
                      },
                      child: Icon(
                        LineIcons.camera_alt,
                        color: theme.getColor(ThemeColor.secondary),
                        size: layout.sizeToIconSize(LayoutSize.medium),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: containers.maxWidth,
                  height: containers.maxHeight * 0.85,
                  color: Colors.white30,
                  child: GridView.count(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: fixedListImage.map((index) => imageTag(image: listImage[index],index: index)).toList(),
                  ))
            ],
          );
        },
      ),
    );
  }
}
