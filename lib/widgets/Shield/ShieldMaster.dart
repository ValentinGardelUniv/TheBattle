import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:projet/widgets/Custom/CustomText.dart';
import 'package:projet/widgets/Shield/ShieldDetail.dart';

class ShieldMaster extends StatefulWidget {
  final Function updateShieldColor, updateShieldImage;
  final int shieldIndex, shieldIconIndex;
  final Color shieldColor, shieldIconColor;
  final double shieldFraction, shieldIconFraction;

  const ShieldMaster(
      this.updateShieldColor,
      this.updateShieldImage,
      this.shieldFraction,
      this.shieldIconFraction,
      this.shieldIndex,
      this.shieldIconIndex,
      this.shieldColor,
      this.shieldIconColor,
      {Key key})
      : super(key: key);
  @override
  _ShieldMasterState createState() => _ShieldMasterState();
}

class _ShieldMasterState extends State<ShieldMaster> {
  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText("Choose a Shield:"),
        ),
        ShieldDetail(
          this.widget.updateShieldImage,
          this.widget.shieldFraction,
          this.widget.shieldIconFraction,
          this.widget.shieldIndex,
          this.widget.shieldIconIndex,
          this.widget.shieldColor,
          this.widget.shieldIconColor,
        ),
        ColorPicker(
          enableShadesSelection: false,
          color: this.widget.shieldColor,
          onColorChanged: this.widget.updateShieldColor,
          width: 44,
          height: 44,
          borderRadius: 22,
          heading: CustomText(
            'Select shield color:',
          ),
          subheading: CustomText(
            'Select color shade:',
          ),
        ),
      ],
    );
  }
}
