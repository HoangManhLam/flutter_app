import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AddStateMixin {
  int counter = 1;
  int unitPrice = 5;
  int price = 5;
  int wallet = 0;

  void updatePrice() {
    price = counter * unitPrice;
  }

  void updateWallet() {
    wallet = price + 1;
  }
}

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => AddState();
}

class AddState extends State<Add> with AddStateMixin {
  @override
  void updatePrice() {
    setState(() {
      super.updatePrice();
    });
  }

  @override
  void updateWallet() {
    setState(() {
      super.updateWallet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage('asset/cf4.png'), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Caffee Mocha',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Deep Foam',
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
            const SizedBox(
              width: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(Size(15, 15)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    setState(() {
                      if (counter > 0) counter--;
                      updatePrice();
                      updateWallet();
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text('$counter'),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(Size(15, 15)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    setState(() {
                      counter++;
                      updatePrice();
                      updateWallet();
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 5,
          color: const Color(0xFFF9F2ED),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black45,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.sell_outlined,
                  color: Color(0xFFC67C4E),
                ),
              ),
              const Text(
                '1 Discount is Applies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 140,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Payment Summary',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Price',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              "\$ $price.00",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with AddStateMixin {
  @override
  void updatePrice() {
    setState(() {
      super.updatePrice();
    });
  }

  @override
  void updateWallet() {
    setState(() {
      super.updateWallet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  size: 25,
                  Icons.wallet,
                  color: Color(0xFFC67C4E),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cash/Wallet',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "\$ $wallet.0",
                      style: TextStyle(
                          color: Color(0xFFC67C4E),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 257,
                ),
                Icon(
                  size: 40,
                  Icons.keyboard_arrow_down,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                fixedSize: MaterialStateProperty.all(Size(500, 40)),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFFC67C4E),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () {},
              child: const Text(
                'Order',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
