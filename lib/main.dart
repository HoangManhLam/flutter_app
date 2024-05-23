import 'package:flutter/material.dart';
import 'screen/start.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen/home.dart';
import 'screen/category.dart';
import 'screen/Detail/detail.dart';
import 'screen/Order/order.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Sora',
        primaryColor: null,
        primarySwatch: Colors.grey,
        // textTheme: Typography.material2021().white.copyWith(
        //       // This will be the style of entered TextField text
        //       titleMedium: const TextStyle(
        //         fontSize: 16,
        //         color: Colors.black,
        //         fontWeight: FontWeight.w300,
        //       ),
        //     ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionHandleColor: Colors.grey,
          selectionColor: Color.fromARGB(255, 233, 232, 232),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Hoàng Mạnh Lâm',
      home: StartScreen(),
    ),
  );
}
