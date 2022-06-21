import 'package:e_store/screens/cart.dart';
import 'package:e_store/screens/products.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      body: _index == 0 ? Products() : Cart(),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: c1,
        selectedItemColor: c2,
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Products'),
          FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
        ],
      ),
    );
  }

  // int _currentIndex = 0;
  // late PageController _pageController;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SizedBox.expand(
  //       child: PageView(
  //         controller: _pageController,
  //         onPageChanged: (index) {
  //           setState(() => _currentIndex = index);
  //         },
  //         children: <Widget>[
  //           Products(),
  //           Cart(),
  //         ],
  //       ),
  //     ),
  //     bottomNavigationBar: BottomNavyBar(
  //       selectedIndex: _currentIndex,
  //       onItemSelected: (index) {
  //         setState(() => _currentIndex = index);
  //         _pageController.jumpToPage(index);
  //       },
  //       items: <BottomNavyBarItem>[
  //         BottomNavyBarItem(title: Text('Products'), icon: Icon(Icons.home)),
  //         BottomNavyBarItem(
  //             title: Text('Cart'), icon: Icon(Icons.shopping_cart)),
  //       ],
  //     ),
  //   );
  // }

}
