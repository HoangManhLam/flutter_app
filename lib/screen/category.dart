import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screen/Detail/detail.dart';

class Category extends StatelessWidget {
  Category({super.key});
  final List<String> coffee = <String>[
    'asset/cf1.png',
    'asset/cf2.png',
    'asset/cf3.png',
    'asset/cf4.png'
  ];
  final List<String> textCoffee = <String>[
    'Caffe Mocha',
    'Flat White',
    'Caffe Milk',
    'Caffe',
  ];
  final List<String> textCoffee2 = <String>[
    'Deep Foam',
    'Espresso',
    'Espresso',
    'Deep Foam',
  ];
  final List<num> priceCoffe = <num>[
    4.5,
    5.7,
    6.8,
    7.9,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing:
            20, // Khoảng cách giữa các widget theo trục chính (theo chiều dọc)
      ),
      itemBuilder: (context, int index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(coffee[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textCoffee[index],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textCoffee2[index],
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$ ${priceCoffe[index]}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 95,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all(Size(30, 30)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFC67C4E)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(
                                  priceCoffe: priceCoffe[index],
                                  coffee: coffee[index],
                                  textCoffee: textCoffee[index],
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            color: Colors.white,
                            Icons.add,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
