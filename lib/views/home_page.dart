import 'package:coffee_app_ui/widget/coffee_tile.dart';
import 'package:coffee_app_ui/widget/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeTypeList = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Express',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  void coffeeTypeSellected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypeList.length; i++) {
        coffeeTypeList[i][1] = false;
      }
      coffeeTypeList[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.abrilFatface(
                fontSize: 45,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypeList.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeTypeList[index][0],
                  isSellected: coffeeTypeList[index][1],
                  onTap: () {
                    coffeeTypeSellected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'images/coffee2.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '\$3.99',
                  coffeeSubtitle: 'With Almond Milk',
                ),
                CoffeeTile(
                  coffeeImagePath: 'images/coffee1.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '\$5.99',
                  coffeeSubtitle: 'With Almond Milk',
                ),
                CoffeeTile(
                  coffeeImagePath: 'images/coffee2.jpg',
                  coffeeName: 'Express',
                  coffeePrice: '\$2.99',
                  coffeeSubtitle: 'No Milk',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
