import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/Detail/size.dart';
import 'package:flutter_app/screen/Order/order.dart';

class Detail extends StatefulWidget {
  Detail({
    super.key,
    required this.priceCoffe,
    required this.coffee,
    required this.textCoffee,
  });
  num priceCoffe;
  String coffee;
  String textCoffee;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String selectedSize = 'M';
  late num price;
  String? coffee;
  String? textCoffee;

  @override
  void initState() {
    // TODO: implement initState
    price = widget.priceCoffe;
    coffee = widget.coffee;
    textCoffee = widget.textCoffee;

    super.initState();
  }

  void updatePriceDetail(String size) {
    setState(() {
      selectedSize = size;
      if (selectedSize == 'S') {
        price = widget.priceCoffe - 1;
      } else if (selectedSize == 'M') {
        price = widget.priceCoffe;
      } else if (selectedSize == 'L') {
        price = widget.priceCoffe + 1;
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
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Detail'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('$coffee'), fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$textCoffee',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ice/Hot',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFF9F2ED),
                              shape: BoxShape.rectangle,
                            ),
                            child: const Icon(
                              size: 25,
                              Icons.local_shipping,
                              color: Color(0xFFC67C4E),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFF9F2ED),
                              shape: BoxShape.rectangle,
                            ),
                            child: const Icon(Icons.local_cafe,
                                size: 25, color: Color(0xFFC67C4E)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFF9F2ED),
                              shape: BoxShape.rectangle,
                            ),
                            child: const Icon(Icons.local_grocery_store,
                                size: 25, color: Color(0xFFC67C4E)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Text(
                        '4.8',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '(230)',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ],
              ),
              const Center(
                child: SizedBox(
                  height: 20,
                  child: Text(
                      '-----------------------------------------------------'),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Size',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildButton('S'),
                      buildButton('M'),
                      buildButton('L'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                  ),
                  Text(
                    '\$ ${price}0',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFC67C4E)),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(Size(300, 50)),
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFFC67C4E),
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Order(
                              price: price,
                              coffee: widget.coffee,
                              textCoffee: widget.textCoffee,
                            )),
                  );
                },
                child: const Text(
                  'Buy Now',
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

  Widget buildButton(String size) {
    final bool isSelected = selectedSize == size;
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: isSelected ? Color(0xFFC67C4E) : Colors.black,
            width: 1,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        fixedSize: MaterialStateProperty.all(Size(120, 50)),
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Color(0xFFEDD6C8) : Colors.white,
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () {
        updatePriceDetail(size);
      },
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Color(0xFFC67C4E) : Colors.black,
        ),
      ),
    );
  }
}
