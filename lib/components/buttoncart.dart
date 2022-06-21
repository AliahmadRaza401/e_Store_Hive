import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final IconData? iconData;
  final Color? color;
  final VoidCallback? onTap;
  final String? label;

  CartButton({Key? key, this.iconData, this.color, this.onTap, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 77,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Row(
          children: <Widget>[
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                  color: Color(0xFF6982B4), //darker
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Icon(iconData, size: 39),
            ),
            SizedBox(width: 20),
            Text(label!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ],
        ),
      ),
    );
  }
}
