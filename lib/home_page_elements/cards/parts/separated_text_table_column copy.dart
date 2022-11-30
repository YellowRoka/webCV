import 'package:flutter/material.dart';

class SeparatedTextTableColumn extends StatelessWidget {
  final List<String>     firstTextList;
  final List<String>     secundsTextList;
  final TextStyle        firstLineTextStyle;
  final TextStyle?       otherLinesTextStyle;

  const SeparatedTextTableColumn( { Key? key, required this.firstTextList, required this.secundsTextList, required this.firstLineTextStyle, this.otherLinesTextStyle } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    TextStyle secundTextStyleIntern = otherLinesTextStyle ?? firstLineTextStyle;

    return Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        //DataRow(firstTextList, 98, firstLineTextStyle, secundTextStyleIntern),
        //const SizedBox( width: 10 ),
        //DataRow(secundsTextList, 242, firstLineTextStyle, secundTextStyleIntern),

        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for( int index = 0; index < firstTextList.length; index++ )...[
              const SizedBox( height: 10 ),
                    SizedBox(child: Text( firstTextList[ index ],  maxLines: 10, overflow: TextOverflow.clip, style: ( index == 0 )?(firstLineTextStyle ):( secundTextStyleIntern ) )),
              const SizedBox( height: 10 ),
            ]
          ]
        ),
        
        const SizedBox( width: 10 ),

        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for( int index = 0; index < secundsTextList.length; index++ )...[
              const SizedBox( height: 10 ),
                    SizedBox( width: 248, child: Text( secundsTextList[ index ],  maxLines: 10, overflow: TextOverflow.clip, style: ( index == 0 )?(firstLineTextStyle ):( secundTextStyleIntern ) ) ),
              const SizedBox( height: 10 ),
            ]
          ]
        ),

      ],
    );
  }
}

class DataRow extends StatelessWidget {
  final List<String> textList;
  final double width;
  final TextStyle style1;
  final TextStyle style2;

  const DataRow(this.textList, this.width, this.style1, this.style2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for( int index = 0; index < textList.length; index++ )...[
          const SizedBox( height: 10 ),
                SizedBox( width: width, child: Text( textList[ index ],  maxLines: 10, overflow: TextOverflow.clip, style: ( index == 0 )?(style1 ):( style2 ) )),
          const SizedBox( height: 10 ),
        ]
      ]
    );
  }
}
