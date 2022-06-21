import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final IconData? iconData;
  final Color? color;
  final VoidCallback? onTap;

  ButtonOne({Key? key, this.iconData, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)), color: color),
        child: Icon(iconData, size: 33),
      ),
    );
  }
}
