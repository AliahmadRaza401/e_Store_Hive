import 'package:flutter/material.dart';

class GiftCardsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.76,
            child: Image.asset("assets/images/itunes.jpg", fit: BoxFit.contain),
          ),
          SizedBox(height: 20),
          Text(
            "iTunes Gift Card",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '\$100',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '\$120',
                      style: TextStyle(
                          color: Color(0xFFF707070),
                          fontSize: 21,
                          decoration: TextDecoration.lineThrough))
                ]),
              ),
              Container(
                width: 150,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFF809EDC),
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                child: Text(
                  "10% OFF",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
