import 'package:flutter/material.dart';

import '../../../../../common/json_workers/json_basedata_objs.dart';
import '../../../../../common/widgets/base_card.dart';
import 'parts/separated_text_table_column.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataCard extends StatelessWidget{
  final BaseDataConverter description;
  final double?           width;
  final double?           height;

  const DataCard( { Key? key, required this.description, this.width, this.height } ) : super( key: key );

  @override
  Widget build( BuildContext context ){

    const TextStyle headStyle = TextStyle( color: Colors.white, fontSize: 20, decoration: TextDecoration.none );
    const TextStyle textStyle = TextStyle( color: Colors.white, fontSize: 18, decoration: TextDecoration.none );

    AppLocalizations localizations = AppLocalizations.of(context);

    return BaseCard(
      height:   height,
      width:    width,
      children: [
        Flex(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction:          ( MediaQuery.of( context ).size.width > 660 )?( Axis.horizontal ):( Axis.vertical ),
          children:  [
            
            Container(
              height:     220,
              width:      220,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius:   5,
                    spreadRadius: 2,
                    color:      Colors.white
                  )
                ]
              ),
              child: ClipOval(
                child: Image(
                  fit: BoxFit.contain,
                  color: Colors.transparent,
                  image: AssetImage('assets/${ description.image }'),
                ),
              ),
            ),

            ( MediaQuery.of( context ).size.width < 661 ) ?
            ( Container(height: 10)                     ) :
            ( const SizedBox(
                width:  30,
                height: 290,
                child:  VerticalDivider( thickness: 1, color: Colors.white )
              ) 
            ),
            
            SizedBox(
              key:   const Key( "cdata" ),
              child: SeparatedTextTableColumn(
                firstLineTextStyle:  headStyle,
                otherLinesTextStyle: textStyle,
                firstTextList: [
                  localizations.name,   
                  localizations.birth,  
                  localizations.mobile, 
                  localizations.email,  
                  localizations.address,
                  localizations.address
                  ],
                secundsTextList: [
                  description.name,   
                  description.birth,  
                  description.mobile, 
                  description.mail,   
                  description.address1,
                  description.address2
                ]
              ),
            )

          ],
        )
      ]
    );
  }
}
