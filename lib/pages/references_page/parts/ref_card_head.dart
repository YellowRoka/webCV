import 'package:flutter/material.dart';

class RefCardHead extends StatelessWidget {
  final String text;

  const RefCardHead({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child:  Center( child: Text( text, style: const TextStyle( color: Colors.white, fontSize: 32 ) ))
    );
  }
}
