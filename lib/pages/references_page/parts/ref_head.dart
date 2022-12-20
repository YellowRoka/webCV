import 'package:flutter/material.dart';

class RefHead extends StatelessWidget {
  final String text;

  const RefHead({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child:  Center( child: Text( text, style: const TextStyle( color: Colors.white, fontSize: 32 ) ))
    );
  }
}
