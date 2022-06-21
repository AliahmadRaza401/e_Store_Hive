import 'package:e_store/provider/cart_provider.dart';
import 'package:e_store/provider/item_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider()),
  ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
];
