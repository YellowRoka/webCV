import 'package:flutter/material.dart';



import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_cv/common/json_workers/json_jobs_objs.dart';
import 'package:web_cv/common/widgets/base_card.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/cards/parts/separated_text_table_column.dart';

class JobCard extends StatelessWidget {
  final JobData description; 
  final double? width;
  final double? height;

  const JobCard( { Key? key, required this.description, this.width, this.height } ) : super( key: key );

  @override
  Widget build(BuildContext context) {

    const TextStyle headStyle = TextStyle( color: Colors.white, fontSize: 20, decoration: TextDecoration.none );
    const TextStyle textStyle = TextStyle( color: Colors.white, fontSize: 18, decoration: TextDecoration.none );

    AppLocalizations? localizations = AppLocalizations.of(context);

    return BaseCard(
      height:    height,
      width:    width,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Flex(

              direction:          ( MediaQuery.of(context).size.width > 660 )?( Axis.horizontal ):( Axis.vertical ),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.start,
              children: [
                Container(
                  height:     150,
                  width:      150,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
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
                      //color: Colors.transparent,
                      image: AssetImage('assets/companies_images/${ description.image }'),
                    ),
                  ),
                ),

                const SizedBox(width: 30, height: 5),

                Column(
                  key: const Key( "cjobs" ),
                  mainAxisAlignment:  MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[

                  SeparatedTextTableColumn(
                    firstLineTextStyle: headStyle,
                    otherLinesTextStyle:textStyle,
                    firstTextList: [
                      localizations!.company, 
                      localizations.position,
                      localizations.date,    
                      localizations.place,   
                    ],
                    secundsTextList: [
                      description.company, 
                      description.position,
                      description.date,    
                      description.place,   
                    ]
                  ),
                  ]
                )
              ],
            ),
            
            const SizedBox( height: 20 ),

            SizedBox(
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( localizations.tasks,        style: headStyle ), const SizedBox( height: 10 ), Text( description.tasks,      style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 30 ),
                  Text( localizations.experiences,  style: headStyle ), const SizedBox( height: 10 ), Text( description.experinces, style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 30 ),
                  Text( localizations.progLang,     style: headStyle ), const SizedBox( height: 10 ), Text( description.languages,  style: textStyle, maxLines: 10, overflow: TextOverflow.clip ), const SizedBox( height: 30 ),
                  
                  Text( description.commit??"", style: textStyle, maxLines: 10, overflow: TextOverflow.ellipsis )
                ],
                
              ),
            )
          ],
        )
      ],
    );
  }
}
