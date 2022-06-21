// ignore_for_file: prefer_const_constructors

import 'package:e_store/provider/cart_provider.dart';
import 'package:e_store/utils/app_size.dart';
import 'package:e_store/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../provider/item_provider.dart';
import '../widgets/size_config.dart';

class Products extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  var image;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    context.watch<ProductProvider>().getProductItem();

    return Consumer<ProductProvider>(
      builder: (context, model, child) {
        return Container(
          height: AppSizes.dynamicHeight(context, 0.9),
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 6),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lato',
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.dynamicHeight(context, 0.02),
                      ),
                      model.productList.length <= 0
                          ? Container(
                              child: Center(
                                child: Text("No Product"),
                              ),
                            )
                          : Container(
                              height: AppSizes.dynamicHeight(context, 0.77),
                              child: ListView.builder(
                                itemCount: model.productList.length,
                                itemBuilder: (context, index) {
                                  Product inv = model.productList[index];
                                  return InkWell(
                                    onLongPress: () {
                                      model.deleteProductItem(index);
                                    },
                                    child: Container(
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
                                      height:
                                          AppSizes.dynamicHeight(context, 0.15),
                                      // width: 50.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    inv.name.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          AppSizes.dynamicWidth(
                                                              context, 0.05),
                                                    ),
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Consumer<CartProvider>(
                                                builder:
                                                    ((context, value, child) {
                                                  return InkWell(
                                                    onTap: () {
                                                      print("Adding to Cart");
                                                      // var inventoryDb = Provider
                                                      //     .of<CartProvider>(
                                                      //         context,
                                                      //         listen: false);
                                                      if (value.cartList
                                                              .isEmpty ||
                                                          value.cartList
                                                                  .length <
                                                              0) {
                                                        value.addCartItem(
                                                          CartModel(
                                                            name: inv.name
                                                                .toString(),
                                                            image: "",
                                                            date:
                                                                DateTime.now(),
                                                            price: inv.price
                                                                .toString(),
                                                            quantity: "1",
                                                          ),
                                                        );
                                                        value.getCartItem();
                                                        AppToast.successToast(
                                                            "Success!",
                                                            "Item Add Successfully",
                                                            context);
                                                      } else {
                                                        value.cartList
                                                            .forEach((element) {
                                                          if (element.name
                                                                  .toString() ==
                                                              inv.name
                                                                  .toString()) {
                                                            AppToast.failureToast(
                                                                "Fail",
                                                                "Item already added",
                                                                context);
                                                          } else {
                                                            value.addCartItem(
                                                              CartModel(
                                                                name: inv.name
                                                                    .toString(),
                                                                image: "",
                                                                date: DateTime
                                                                    .now(),
                                                                price: inv.price
                                                                    .toString(),
                                                                quantity: "1",
                                                              ),
                                                            );
                                                            value.getCartItem();
                                                            AppToast.successToast(
                                                                "Success!",
                                                                "Item Add Successfully",
                                                                context);
                                                          }
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      width:
                                                          AppSizes.dynamicWidth(
                                                              context, 0.1),
                                                      height: AppSizes
                                                          .dynamicHeight(
                                                              context, 0.08),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.orange,
                                                      ),
                                                      child: Icon(
                                                        Icons.shopping_cart,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ],
                                          ))),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                inputItemDialog(context, 'add');
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        );
      },
    );
  }

  inputItemDialog(BuildContext context, String action, [int? index]) {
    var inventoryDb = Provider.of<ProductProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 40,
            ),
            height: AppSizes.dynamicHeight(context, 0.5),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Add Product',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Product name cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Product name',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Product Price cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: ' Price',
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            print(
                                'nameController.text: ${nameController.text}');
                            print(
                                'oldPriceController: ${priceController.text}');

                            await inventoryDb.addProductItem(Product(
                              name: nameController.text.toString(),
                              image: '',
                              date: DateTime.now(),
                              price: priceController.text.toString(),
                            ));

                            nameController.clear();
                            priceController.clear();

                            inventoryDb.getProductItem();

                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: AppSizes.dynamicWidth(context, 0.5),
                          height: AppSizes.dynamicHeight(context, 0.07),
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.dynamicWidth(context, 0.03),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Add Item",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.dynamicWidth(context, 0.04),
                            ),
                          ),
                        ),
                      ),
                      // RaisedButton(
                      //   onPressed: () async {
                      //     if (_formKey.currentState!.validate()) {
                      //       print(
                      //           'nameController.text: ${nameController.text}');
                      //       print(
                      //           'oldPriceController: ${priceController.text}');

                      //       await inventoryDb.addProductItem(Product(
                      //         name: nameController.text.toString(),
                      //         image: '',
                      //         date: DateTime.now(),
                      //         price: priceController.text.toString(),
                      //       ));

                      //       nameController.clear();
                      //       priceController.clear();

                      //       inventoryDb.getProductItem();

                      //       Navigator.pop(context);
                      //     }
                      //   },
                      //   color: Colors.green[600],
                      //   child: Text(
                      //     'Add',
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 20,
                      )
                    ],
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
