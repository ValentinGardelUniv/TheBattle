import 'package:flutter/material.dart';
import 'package:projet/models/Shield.dart';
import 'package:projet/models/ShieldIcon.dart';

class ShieldDetail extends StatefulWidget {
  final Function updateShieldImage;
  final int shieldIndex, shieldIconIndex;
  final Color shieldColor, shieldIconColor;
  final double shieldFraction, shieldIconFraction;

  const ShieldDetail(
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
  _ShieldDetailState createState() => _ShieldDetailState();
}

class _ShieldDetailState extends State<ShieldDetail> {
  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: Shield.shields.length,
            controller: PageController(
                viewportFraction: this.widget.shieldFraction,
                initialPage: this.widget.shieldIndex),
            onPageChanged: this.widget.updateShieldImage,
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == this.widget.shieldIndex ? 1 : 0.9,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      this.widget.shieldColor, BlendMode.srcIn),
                  child: Image(
                    image: AssetImage(Shield.shields[i].getUrl()),
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
          ),
          IgnorePointer(
            ignoring: true,
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    this.widget.shieldIconColor, BlendMode.srcIn),
                child: Image(
                  image: AssetImage(
                      ShieldIcon.icons[this.widget.shieldIconIndex].getUrl()),
                  width: MediaQuery.of(context).size.width *
                      this.widget.shieldFraction *
                      this.widget.shieldIconFraction,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
