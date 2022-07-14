import 'package:flutter/material.dart';


import '../../json_workers/jsonBasedataObjs.dart';
import 'base_card.dart';

class SkillsCard extends StatelessWidget {
  final BaseDataConverter description;

  const SkillsCard( { Key? key, required this.description } ) : super( key: key );

  @override
  Widget build( BuildContext context ) {

    const TextStyle textStyle = TextStyle( color:  Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color:  Colors.white, fontSize: 20, decoration: TextDecoration.none );

    return BaseCard(
      heigt:    null,
      width:    null,
      children: [
        Column(
          key:                const Key( "cskills" ),
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox( width: 600 ),

            const Text( "Langauges:",          style: textStyle ), const SizedBox( height: 10 ),
                  Text( description.languages, style: textStyle ), const SizedBox( height: 30 ),

            const Text( "Trainings:",          style: textStyle ), const SizedBox( height: 10 ),

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
