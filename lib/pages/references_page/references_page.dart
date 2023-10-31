import 'package:flutter/material.dart';



import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_cv/common/background/background.dart';
import 'package:web_cv/common/drawer_handler/drawer_handler.dart';
import 'package:web_cv/local_changer/language_changer_with_info.dart';
import 'package:web_cv/pages/references_page/data_structs/references_list_items.dart';
import 'package:web_cv/pages/references_page/parts/cards/ref_card_links.dart';
import 'package:web_cv/pages/references_page/parts/cards/ref_card_video.dart';
import 'package:web_cv/pages/references_page/parts/drawer/drawer_ref.dart';
import 'package:web_cv/pages/references_page/parts/fob/fob_ref_widget.dart';

import 'parts/ref_head.dart';
import 'parts/slider_builder.dart';

int playedVideoIndex = 0;

class ReferencesPage extends StatelessWidget {
  const ReferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FOBRef(),
      drawer:               const DrawerBarRef(),
      onDrawerChanged:      (isOpen) => drawerHandler( context, isOpen ),
      body:                 const ReferencesPageBody(),
    );
  }
}

class ReferencesPageBody extends StatelessWidget {
  const ReferencesPageBody({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){

    AppLocalizations? localizations = AppLocalizations.of(context);

    return Stack(
      children: [

        const Background(),

        Padding(
          padding: const EdgeInsets.fromLTRB( 10, 10, 10, 10 ),
          child: ListView(
            
            children: [

              RefHead( text: localizations!.references ),

              RefHead( text:  localizations.cruzrForMZX ),
              SliderBuilder( referencesList: referencesList1 ),

              RefHead( text: localizations.diverzumTestJob ),
              SliderBuilder( referencesList: referencesList2 ),              
              
              RefHead( text: localizations.ffnextTestJob ),
              SliderBuilder( referencesList: referencesList3 ),
              
              RefHead( text: localizations.referencesVideos ),
              SliderBuilder( referencesList: [

                  RefCardVideo(
                    id:       1,
                    headText: localizations.ote,
                    videoUrl: 
                    "https://drive.google.com/uc?export=view&id=1umt44PWimSKh6ejsKqT28rQ515fvXFzE",
                    //'assets/ref_medias/videos/flutter_help_btn_1.mp4',
                  ),

                  RefCardVideo(
                    id:       2,
                    headText: localizations.czurPlanet,
                    videoUrl: 
                    "https://drive.google.com/uc?export=view&id=1ZnwOSqAzlGLSr-zMkC-oIl9zG4xCOSHu",
                    //'assets/ref_medias/videos/cruzr_2021_planet.mp4',
                  ),

                  RefCardVideo(
                    id:       3,
                    headText: localizations.cruzrMVM,
                    videoUrl: 
                    "https://drive.google.com/uc?export=view&id=1VyYtoGT-H203LIxBYD-hYvPeNHxuFaGQ",
                    //'assets/ref_medias/videos/cruzr_mvm_1.mp4',
                  ),

                  /*VideoCardBox(
                    headText: "localizations.police",
                    videoUrl: 
                    'assets/ref_medias/videos/cruzr_ploice_1.mp4',
                  ),*/

                ],
              ),

              const SizedBox (height: 100 ),
              RefCardLinks( headText: localizations.webLinks )
            ]
          ),
        ),

         const LanguageChangerWithInfo(),
         
      ],
    );
  }
}
