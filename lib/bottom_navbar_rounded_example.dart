import 'package:flutter/material.dart';

class BottomNavRoundedExample extends StatefulWidget {
  const BottomNavRoundedExample({super.key});

  @override
  State<BottomNavRoundedExample> createState() =>
      _BottomNavRoundedExampleState();
}

class _BottomNavRoundedExampleState extends State<BottomNavRoundedExample> {
  List<Widget> bodyList = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyList.elementAt(currentIndex),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            navIcon(id: 0, icon: ImageOf.homeIcon, text: "Home", extra: -3),
            navIcon(id: 1, icon: ImageOf.transactionsIcon, text: "Wallet"),
            navIcon(id: 2, icon: ImageOf.cardIcon, text: "Card"),
            navIcon(id: 3, icon: ImageOf.moreIcon, text: "More"),
          ]),
        ));
  }

  navIcon({int? id, String? icon, String? text, double? extra}) {
    Color color = currentIndex == id ? AppColors.primaryColor : Colors.grey;
    return InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(
                AssetImage(
                  assetIcon(icon!),
                ),
                size: 23 + (extra ?? 0),
                color: color),
            const SizedBox(height: 1),
            Text(text!, style: primaryTextStyle(size: 11, color: color))
          ],
        ),
        onTap: () {
          setState(() {
            currentIndex = id!;
          });
        });
  }

  primaryTextStyle({required int size, required Color color}) {}
}

const assetPath = 'assets/images';
String assetIcon(String imageName, {String type = 'png'}) {
  return '$assetPath/$imageName.$type';
}

class ImageOf {
  static String homeIcon = assetIcon('home_icon');
  static String cardIcon = assetIcon('card_icon');
  static String moreIcon = assetIcon('more_icon');
  static String transactionsIcon = assetIcon('transactions_icon');
}

class AppColors {
  static Color primaryColor = Colors.blue;
}


