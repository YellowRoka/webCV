import 'package:flutter/material.dart';

import '../../json_workers/jsonBasedataObjs.dart';
import 'base_card.dart';

class DataCard extends StatelessWidget{
  final BaseDataConverter description;
  final double?           width;
  final double?           height;

  const DataCard( { Key? key, required this.description, this.width, this.height } ) : super( key: key );

  @override
  Widget build( BuildContext context ){

    const TextStyle textStyle = TextStyle( color: Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color: Colors.white, fontSize: 20, decoration: TextDecoration.none );

    return BaseCard(
      heigt:    height,
      width:    width,
      children: [
        Flex(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: ( MediaQuery.of( context ).size.width > 660 )?( Axis.horizontal ):( Axis.vertical ),
          children:  [

            CircleAvatar(
              radius:          100,
              backgroundImage: AssetImage( 'assets/${ description.image }' ),
            ),

            ( MediaQuery.of( context ).size.width < 660 ) ?
            ( Container(height: 10)                     ) :
            ( const SizedBox(
                width:  30,
                height: 210,
                child:  VerticalDivider( thickness: 1, color: Colors.white )
              ) 
            ),
            
            SizedBox(
              key:   const Key( "cdata" ),
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( "Name:   ${description.name}",       style: headStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 15 ),
                  Text( "Birth:       ${description.birth}", style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 15 ),
                  Text( "Mobile:    ${description.mobile}",  style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 15 ),
                  Text( "Email:       ${description.mail}",  style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 15 ),
                  Text( "Address:  ${description.address1}", style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 15 ),
                  Text( "Address:  ${description.address2}", style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 15 )
                ],
              ),
            )

          ],
        )
      ]
    );
  }
}
