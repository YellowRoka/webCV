import 'package:flutter/material.dart';

import '../../json_workers/jsonBasedataObjs.dart';
import 'base_card.dart';

class DataCard extends StatelessWidget {
  final BaseDataConverter description;

  const DataCard( { Key? key, required this.description } ) : super( key: key );

  @override
  Widget build(BuildContext context) {

    const TextStyle textStyle = TextStyle( color: Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color: Colors.white, fontSize: 20, decoration: TextDecoration.none );

    return BaseCard(
      heigt:    null,
      width:    null,
      children: [
        Row(
          children: [
            CircleAvatar(  
              radius:          100,
              backgroundImage: AssetImage( 'assets/${ description.image }' ),
            ),

            const SizedBox(
              width:  30,
              height: 210,
              child:  VerticalDivider( thickness: 1, color: Colors.white )
            ),
            
            Column(
              key: const Key( "cdata" ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "Name:   ${description.name}",       style: headStyle ), const SizedBox( height: 15 ),
                    Text( "Birth:       ${description.birth}", style: textStyle ), const SizedBox( height: 15 ),
                    Text( "mobile:    ${description.mobile}",  style: textStyle ), const SizedBox( height: 15 ),
                    Text( "Address:  ${description.address1}", style: textStyle ), const SizedBox( height: 15 ),
                    Text( "Address:  ${description.address2}", style: textStyle ), const SizedBox( height: 15 )
                  ],
                )
              ],
            )
          ],
        )
      ]
    );
  }
}
