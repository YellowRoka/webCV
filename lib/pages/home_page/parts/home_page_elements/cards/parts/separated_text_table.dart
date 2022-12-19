import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/56751616/how-to-create-table-like-ui-in-flutter
class SeparatedTextTable extends StatelessWidget {
  final List<String>     firstTextList;
  final List<String>     secundsTextList;
  final TextStyle        firstLineTextStyle;
  final TextStyle?       otherLinesTextStyle;

  const SeparatedTextTable( { Key? key, required this.firstTextList, required this.secundsTextList, required this.firstLineTextStyle, this.otherLinesTextStyle } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    TextStyle secundTextStyleIntern = otherLinesTextStyle ?? firstLineTextStyle;

    return DataTable(
      columnSpacing:      10,
      dataRowHeight:      30,
      dividerThickness:   0,
      horizontalMargin:   0,
      border:             null,
      showCheckboxColumn: false,
      dataTextStyle:      secundTextStyleIntern,
      columns: [
        DataColumn( label: Text( firstTextList[0],   textAlign: TextAlign.start, maxLines: 10, overflow: TextOverflow.clip, style: firstLineTextStyle ) ),
        DataColumn( label: Text( secundsTextList[0], textAlign: TextAlign.start, maxLines: 10, overflow: TextOverflow.clip, style: firstLineTextStyle ) ),
      ],

      rows: [
        for( int index = 1; index < firstTextList.length; index++ )...[
          DataRow(
            cells :[
              DataCell( Text( firstTextList[ index ],   textAlign: TextAlign.start, maxLines: 10, overflow: TextOverflow.clip, style: secundTextStyleIntern ) ),
              DataCell( Text( secundsTextList[ index ], textAlign: TextAlign.start, maxLines: 10, overflow: TextOverflow.clip, style: secundTextStyleIntern ) ),
            ]
          )
        ]
      ]
    );
  }
}
