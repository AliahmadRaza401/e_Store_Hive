import 'package:flutter/material.dart';

class QtyButton extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? onTap;

  QtyButton({Key? key, this.iconData, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 80,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white),
        ),
        child: Icon(iconData, size: 40, color: Colors.white),
      ),
    );
  }
}
