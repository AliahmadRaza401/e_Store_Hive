import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final String? amount;
  final bool? active;

  const SizeButton({Key? key, this.amount, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 75,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: active! ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.white, width: 1.4),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(amount!,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: active! ? Colors.black : Colors.white)),
    );
  }
}
