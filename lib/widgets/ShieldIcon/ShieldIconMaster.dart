import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:projet/widgets/Custom/CustomText.dart';
import 'package:projet/widgets/ShieldIcon/ShieldIconDetail.dart';

class ShieldIconMaster extends StatefulWidget {
  final Function updateShieldIconColor, updateShieldIconImage;
  final double shieldFraction, shieldIconFraction;
  final Color shieldColor, shieldIconColor;
  final int shieldIndex, shieldIconIndex;

  const ShieldIconMaster(
      this.updateShieldIconColor,
      this.updateShieldIconImage,
      this.shieldFraction,
      this.shieldIconFraction,
      this.shieldIndex,
      this.shieldIconIndex,
      this.shieldColor,
      this.shieldIconColor,
      {Key key})
      : super(key: key);
  @override
  _ShieldIconMasterState createState() => _ShieldIconMasterState();
}

class _ShieldIconMasterState extends State<ShieldIconMaster> {
  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText("Choose a Shield Icon:"),
        ),
        ShieldIconDetail(
          this.widget.updateShieldIconImage,
          this.widget.shieldFraction,
          this.widget.shieldIconFraction,
          this.widget.shieldIndex,
          this.widget.shieldIconIndex,
          this.widget.shieldColor,
          this.widget.shieldIconColor,
        ),
        ColorPicker(
          enableShadesSelection: true,
          color: this.widget.shieldIconColor,
          onColorChanged: this.widget.updateShieldIconColor,
          width: 44,
          height: 44,
          borderRadius: 22,
          heading: CustomText(
            'Select shield icon color:',
          ),
          subheading: CustomText(
            'Select color shade:',
          ),
        ),
      ],
    );
  }
}
