import 'package:flutter/material.dart';
import 'package:projet/models/Shield.dart';
import 'package:projet/models/ShieldIcon.dart';

class ShieldIconDetail extends StatefulWidget {
  final Function updateShieldImage;
  final int shieldIndex, shieldIconIndex;
  final Color shieldColor, shieldIconColor;
  final double shieldFraction, shieldIconFraction;

  const ShieldIconDetail(
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
  _ShieldIconDetailState createState() => _ShieldIconDetailState();
}

class _ShieldIconDetailState extends State<ShieldIconDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Center(
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(this.widget.shieldColor, BlendMode.srcIn),
              child: Image(
                image: AssetImage(
                    Shield.shields[this.widget.shieldIndex].getUrl()),
                width: MediaQuery.of(context).size.width *
                    this.widget.shieldFraction,
              ),
            ),
          ),
          PageView.builder(
            itemCount: ShieldIcon.icons.length,
            controller:
                PageController(viewportFraction: this.widget.shieldFraction),
            onPageChanged: this.widget.updateShieldImage,
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == this.widget.shieldIconIndex
                    ? this.widget.shieldIconFraction
                    : this.widget.shieldFraction *
                        this.widget.shieldIconFraction *
                        2,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      this.widget.shieldIconColor, BlendMode.srcIn),
                  child: Image(
                    image: AssetImage(ShieldIcon.icons[i].getUrl()),
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
