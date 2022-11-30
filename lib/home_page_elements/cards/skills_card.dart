import 'package:flutter/material.dart';


import '../../json_workers/jsonBasedataObjs.dart';
import 'base_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SkillsCard extends StatelessWidget {
  final BaseDataConverter description;
  final double?           width;
  final double?           height;

  const SkillsCard( { Key? key, required this.description, this.width, this.height } ) : super( key: key );

  @override
  Widget build( BuildContext context ) {

    const TextStyle textStyle = TextStyle( color:  Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color:  Colors.white, fontSize: 22, decoration: TextDecoration.none );

    AppLocalizations localizations = AppLocalizations.of(context);
    return BaseCard(
      heigt:    height,
      width:    width,
      children: [
        Column(
          key:                const Key( "cskills" ),
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox( width: 900 ),

            Text( localizations.langauges, style: headStyle ), const SizedBox( height: 10 ),
            Text( description.languages,   style: textStyle ), const SizedBox( height: 30 ),
            Text( localizations.trainings, style: headStyle ), const SizedBox( height: 10 ),

            for( var it in description.trainings )...[
              Text( it.name, style: textStyle ), 
              const SizedBox( height: 20 ),
            ]
          ],
        ), 
      ],
    );
  }
}
