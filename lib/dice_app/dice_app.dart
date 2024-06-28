import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterObject {
  int _counter = 0;
  Image _image = Image.asset('assets/images/dice-1.png');
  List<Image> imagelist = [
    Image.asset('assets/images/dice-1.png'),
    Image.asset('assets/images/dice-2.png'),
    Image.asset('assets/images/dice-3.png'),
    Image.asset('assets/images/dice-4.png'),
    Image.asset('assets/images/dice-5.png'),
    Image.asset('assets/images/dice-6.png'),
    Image.asset('assets/images/bitcoin.png'),
  ];

  int get getCounter => _counter;
  set setCounter(int number) => _counter = number;

  Image get getImage => _image;

  Widget getImageWidget() {
    return SizedBox(width: 200,height: 200, child:_image);
  }

  Widget getImageDesc() {
    if(_counter == 7){
      return Text(
        'Congrats. You won a bitcoin', 
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255,255,255,255),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )
      );
    }
    return const Text('');
  }

  void setImage(int number) {
    _image = imagelist[number];
  }

  void rollDice() {
      _counter = Random().nextInt(7) + 1;
      setImage(_counter - 1);
  }
}