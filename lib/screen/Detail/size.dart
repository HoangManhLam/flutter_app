import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Size1 extends StatefulWidget {
  const Size1({super.key});

  @override
  State<Size1> createState() => _Size1State();
}

class _Size1State extends State<Size1> {
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildButton('S'),
        buildButton('M'),
        buildButton('L'),
      ],
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
        setState(() {
          selectedSize = size;
        });
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
