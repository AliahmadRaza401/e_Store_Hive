import 'package:e_store/components/buttonone.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Icon(Icons.arrow_back_ios, size: 30), _alertItem()],
      ),
    );
  }
}

Widget _alertItem() {
  return Container(
    child: Row(
      children: <Widget>[
        ButtonOne(
          iconData: Icons.favorite_border,
          color: Color(0xFF809EDC),
        ),
        SizedBox(width: 16),
        Stack(
          clipBehavior: Clip.none,
          // overflow: Overflow.visible,
          children: <Widget>[
            ButtonOne(
              iconData: Icons.redeem,
              color: Color(0xFF809EDC),
            ),
            _alert()
          ],
        )
      ],
    ),
  );
}

Widget _alert() {
  return Positioned(
    left: -7,
    top: -7,
    child: Container(
      width: 29,
      height: 29,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: Colors.white, width: 2.7)),
      child: Text(
        "3",
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
