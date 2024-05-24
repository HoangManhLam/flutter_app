import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'button.dart';

class Order extends StatefulWidget {
  Order({
    super.key,
    required this.price,
    required this.coffee,
    required this.textCoffee,
  });
  num price;
  String coffee;
  String textCoffee;
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int counter = 1;
  num? price;
  String? coffee;
  String? textCoffee;
  num? price1;
  num? wallet;

  @override
  void initState() {
    price1 = widget.price;
    price = widget.price;
    coffee = widget.coffee;
    textCoffee = widget.textCoffee;
    wallet = price1! + 1;
    super.initState();
  }

  void updatePrice() {
    setState(() {
      price1 = counter * widget.price;
    });
  }

  void updateWallet() {
    setState(() {
      if (counter >= 1) {
        wallet = price1! + 1;
      } else {
        wallet = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Order',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Button(),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivery Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'JI.Kpg Sutoyo',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Kpg.Sutoyo No.620,Bilzen,Tanjungbalai.',
                    style: TextStyle(color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          fixedSize:
                              MaterialStateProperty.all(const Size(150, 30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        label: const Text(
                          'Edit Address',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          size: 15,
                          Icons.edit_square,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          fixedSize:
                              MaterialStateProperty.all(const Size(130, 30)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        label: const Text(
                          'Add Note',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          size: 15,
                          Icons.library_books,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
                '---------------------------------------------------------------'),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('$coffee'), fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$textCoffee',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Text(
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
                            side: const BorderSide(
                                color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(Size(15, 15)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        setState(() {
                          if (counter > 0) counter = counter - 1;
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
                            side: const BorderSide(
                                color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(Size(15, 15)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        setState(() {
                          counter = counter + 1;
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
                  '\$ ${price1?.toStringAsFixed(1) ?? "0.00"}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deelyvery Fee',
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    Text(
                      "\$ 2.0",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$ 1.0",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                  const Icon(
                    size: 25,
                    Icons.wallet,
                    color: Color(0xFFC67C4E),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cash/Wallet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$ ${wallet?.toStringAsFixed(1) ?? "0.00"}',
                        style: const TextStyle(
                            color: Color(0xFFC67C4E),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 257,
                  ),
                  const Icon(
                    size: 40,
                    Icons.keyboard_arrow_down,
                  ),
                ],
              ),
              const SizedBox(
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
      ),
    );
  }
}
