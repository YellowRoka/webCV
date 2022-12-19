import 'package:flutter/material.dart';

class IndexMarkers extends StatelessWidget {
  final int          activeIndex;
  final int          id;
  final VoidCallback cbk;

  const IndexMarkers({Key? key, required this.activeIndex, required this.id, required this.cbk}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return GestureDetector(
      onTap: () => cbk(),
      child: Container(
        padding:    const EdgeInsets.only( bottom: 12 ),
        width:      12.0,
        height:     12.0,
        margin:     const EdgeInsets.symmetric( vertical: 8.0, horizontal: 4.0 ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity( id == activeIndex ? 0.9 : 0.4 )
        ),
      ),
    );
  }
}
