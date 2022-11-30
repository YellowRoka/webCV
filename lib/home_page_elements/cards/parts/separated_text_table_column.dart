import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';


//https://stackoverflow.com/questions/49307677/how-to-get-height-of-a-widget
//https://pub.dev/packages/measured_size
//https://www.bezkoder.com/dart-map/

class SeparatedTextTableColumn extends StatefulWidget {
  final List<String> firstTextList;
  final List<String> secundsTextList;
  final TextStyle    firstLineTextStyle;
  final TextStyle?   otherLinesTextStyle;

  const SeparatedTextTableColumn( { Key? key, required this.firstTextList, required this.secundsTextList, required this.firstLineTextStyle, this.otherLinesTextStyle } ) : super(key: key);

  @override
  State<SeparatedTextTableColumn> createState() => _SeparatedTextTableColumnState();
}

class _SeparatedTextTableColumnState extends State<SeparatedTextTableColumn> {
  
  Map sizeMap = <int?, int?>{};


  @override
  Widget build(BuildContext context) {
    
    TextStyle secundTextStyleIntern = widget.otherLinesTextStyle ?? widget.firstLineTextStyle;

    return Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for( int index = 0; index < widget.firstTextList.length; index++ )...[
              const SizedBox( height: 10 ),

              SizedBox(
                height: sizeMap[index], 
                child:  Text( 
                  widget.firstTextList[ index ],
                  maxLines: 10, 
                  overflow: TextOverflow.clip,
                  style:    ( index == 0 )?(widget.firstLineTextStyle ):( secundTextStyleIntern )
                )
              ),
              
              const SizedBox( height: 10 ),
            ]
          ]
        ),
        
        const SizedBox( width: 10 ),

        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for( int index = 0; index < widget.secundsTextList.length; index++ )...[
              const SizedBox( height: 10 ),

                    MeasuredSize(
                      onChange: (size) => setState( () => sizeMap[index] = size.height ),
                      child:    SizedBox( 
                        width:  248, 
                        child:  Text( 
                          widget.secundsTextList[ index ],  
                          maxLines: 10, 
                          overflow: TextOverflow.clip, 
                          style:    ( index == 0 )?( widget.firstLineTextStyle ):( secundTextStyleIntern ) 
                        )
                      )
                    ),
              
              const SizedBox( height: 10 ),
            ]
          ]
        ),

      ],
    );
  }
}
