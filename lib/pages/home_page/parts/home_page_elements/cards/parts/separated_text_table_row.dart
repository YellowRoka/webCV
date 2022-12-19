import 'package:flutter/material.dart';

class SeparatedTextTableRow extends StatelessWidget {
  final String     firstText;
  final String     secundsText;
  final TextStyle  firstTextStyle;
  final TextStyle? secundTextStyle;

  const SeparatedTextTableRow( { Key? key, required this.firstText, required this.secundsText, required this.firstTextStyle, this.secundTextStyle } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    TextStyle secundTextStyleIntern = secundTextStyle ?? firstTextStyle;
  
    return SizedBox(
      width: 480,
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible( flex:3, child: Text( firstText, style: firstTextStyle )),
          const Flexible( flex:1, child: SizedBox( width: 10 ) ),
          //const Spacer( flex: 1 ),
          Flexible( flex:4, child: Text( secundsText, style: secundTextStyleIntern, maxLines: 10, overflow: TextOverflow.clip )),
        ],
      ),
    );
  }
}
