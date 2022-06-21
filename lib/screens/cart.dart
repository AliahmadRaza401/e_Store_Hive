// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:e_store/provider/cart_provider.dart';
import 'package:e_store/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../provider/item_provider.dart';
import '../widgets/size_config.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // int totalPrice = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Provider.of<CartProvider>(context, listen: false).getCartItem();
    Provider.of<CartProvider>(context, listen: false).totalPrice = 0;

    Provider.of<CartProvider>(context, listen: false).calculateTotalPrice();
    // context.watch<CartProvider>().calculateTotalPrice();
    return Consumer<CartProvider>(
      builder: (context, model, child) {
        // model.calculateTotalPrice();
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
            height: AppSizes.dynamicHeight(context, 1),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 6),
                child: SingleChildScrollView(
                  child: Container(
                    // color: Colors.amber,
                    height: AppSizes.dynamicHeight(context, 0.8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Cart',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              SizedBox(
                                height: AppSizes.dynamicHeight(context, 0.02),
                              ),
                              model.cartList.length <= 0
                                  ? Container(
                                      child: Center(
                                        child: Text("No Product"),
                                      ),
                                    )
                                  : Container(
                                      // color: Colors.amber,
                                      height:
                                          AppSizes.dynamicHeight(context, 0.5),
                                      child: ListView.builder(
                                        itemCount: model.cartList.length,
                                        itemBuilder: (context, index) {
                                          CartModel inv = model.cartList[index];
                                          // int price  = int.parse(inv.price);
                                          // totalPrice = totalPrice + price;
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: AppSizes.dynamicHeight(
                                                  context, 0.01),
                                              horizontal: AppSizes.dynamicWidth(
                                                  context, 0.03),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: AppSizes.dynamicHeight(
                                                  context, 0.005),
                                              horizontal: AppSizes.dynamicWidth(
                                                  context, 0.05),
                                            ),
                                            height: AppSizes.dynamicHeight(
                                                context, 0.1),
                                            // width: 50.width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Image.asset(
                                                    'assets/images/itunes.jpg'),
                                                SizedBox(
                                                  width: AppSizes.dynamicWidth(
                                                      context, 0.07),
                                                ),
                                                Flexible(
                                                    child: Container(
                                                        // color: Colors.amber,
                                                        // margin: EdgeInsets.symmetric(
                                                        //   horizontal: AppSizes.dynamicWidth(
                                                        //       context, 0.05),
                                                        // ),
                                                        child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          inv.name.toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: AppSizes
                                                                .dynamicWidth(
                                                                    context,
                                                                    0.04),
                                                          ),
                                                        ),
                                                        Container(
                                                          // color: Colors.amber,
                                                          width: AppSizes
                                                              .dynamicWidth(
                                                                  context, 0.3),
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  int quantity =
                                                                      int.parse(
                                                                          inv.quantity);
                                                                  int newQuan =
                                                                      quantity -
                                                                          1;
                                                                  int myquan =
                                                                      newQuan <=
                                                                              0
                                                                          ? 1
                                                                          : newQuan;
                                                                  model
                                                                      .updateCartItem(
                                                                    index,
                                                                    CartModel(
                                                                        name: inv
                                                                            .name,
                                                                        image: inv
                                                                            .image,
                                                                        date: inv
                                                                            .date,
                                                                        price: inv
                                                                            .price,
                                                                        quantity:
                                                                            myquan.toString()),
                                                                  );
                                                                  // model
                                                                  //     .getCartItem();
                                                                  // model
                                                                  //     .calculateTotalPrice();
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .blueGrey,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "${inv.quantity.toString()}",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  // fontWeight: FontWeight.bold,
                                                                  fontSize: AppSizes
                                                                      .dynamicWidth(
                                                                          context,
                                                                          0.03),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  int quantity =
                                                                      int.parse(
                                                                          inv.quantity);
                                                                  int newQuan =
                                                                      quantity +
                                                                          1;

                                                                  int difference =
                                                                      newQuan -
                                                                          quantity;
                                                                  log('difference: ${difference}');

                                                                  model
                                                                      .updateCartItem(
                                                                    index,
                                                                    CartModel(
                                                                        name: inv
                                                                            .name,
                                                                        image: inv
                                                                            .image,
                                                                        date: inv
                                                                            .date,
                                                                        price: inv
                                                                            .price,
                                                                        quantity:
                                                                            newQuan.toString()),
                                                                  );
                                                                  // model
                                                                  //     .getCartItem();
                                                                  // model
                                                                  //     .calculateTotalPrice();
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .orange,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "\$${inv.price.toString()}",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize: AppSizes
                                                                .dynamicWidth(
                                                                    context,
                                                                    0.04),
                                                          ),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              model
                                                                  .deleteCartItem(
                                                                      index);
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ))),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.dynamicWidth(context, 0.03),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Total Price:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      AppSizes.dynamicWidth(context, 0.04),
                                ),
                              ),
                              Text(
                                "\$${model.totalPrice.toString()}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      AppSizes.dynamicWidth(context, 0.04),
                                ),
                              ),
                            ],
                          ),
                        ),
                        model.cartList.length <= 0
                            ? SizedBox()
                            : Container(
                                alignment: Alignment.center,
                                width: AppSizes.dynamicWidth(context, 1),
                                height: AppSizes.dynamicHeight(context, 0.07),
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      AppSizes.dynamicWidth(context, 0.03),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Proceed To Pay",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        AppSizes.dynamicWidth(context, 0.05),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
