import 'package:flutter/material.dart';


import '../../../../../common/json_workers/json_basedata_objs.dart';
import '../../../../../common/widgets/base_card.dart';
import 'parts/separated_text_table_column.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SchoolCard extends StatelessWidget{
  final Schools description;
  final double? width;
  final double? height;

  const SchoolCard( { Key? key, required this.description, this.width, this.height } ) : super( key: key );
  
  @override
  Widget build( BuildContext context ) {

    const TextStyle textStyle = TextStyle( color: Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color: Colors.white, fontSize: 20, decoration: TextDecoration.none );

    AppLocalizations localizations = AppLocalizations.of(context);

    return BaseCard( 
      height:    height, 
      width:    width,
      children: [
        Column(
          key:                const Key("cschools"),
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SeparatedTextTableColumn(
              firstLineTextStyle: headStyle,
              otherLinesTextStyle:textStyle,
              firstTextList: [
                localizations.university,
                localizations.date,      
              ],
              secundsTextList: [
                description.name,
                description.date,
              ],
            ),

            Text( localizations.generalSubs,      style: textStyle ), const SizedBox( height: 10 ),
            Text( description.generalSubjects,    style: textStyle ), const SizedBox( height: 20 ),
            Text( localizations.vocationalSubs,   style: textStyle ), const SizedBox( height: 10 ),
            Text( description.vocationalSubjects, style: textStyle ), const SizedBox( height: 20 ),

            Text( "${localizations.thesis} ${description.thesis}",   style: textStyle ), const SizedBox( height: 20 ),

            Text( localizations.brief,    style: textStyle ), const SizedBox( height: 5  ),
            Text( description.brief,      style: textStyle ), const SizedBox( height: 20 ),
            Text( description.commit??"", style: textStyle, maxLines: 10, overflow: TextOverflow.ellipsis ),
          ],
        )
      ]
    );
  }
}
