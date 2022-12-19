import 'package:flutter/material.dart';

import '../../common/background/background.dart';
import '../../common/drawer/drawer_controller.dart';
import 'parts/drawer/drawer_ref.dart';
import 'parts/fob/fob_ref.dart';
import 'parts/cards/ref_card_links.dart';
import 'data_structs/references_list_items.dart';
import 'parts/cards/video_card_box.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'parts/ref_card_head.dart';
import 'parts/slider_builder.dart';

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

    AppLocalizations localizations = AppLocalizations.of(context);

    return Stack(
      children: [

        const Background(),

        Padding(
          padding: const EdgeInsets.fromLTRB( 10, 10, 10, 10 ),
          child: ListView(
            
            children: [

              RefCardHead( text: localizations.referencies ),

              RefCardHead( text:  localizations.cruzrForMZX ),
              SliderBuilder( referenciesList: referenciesList1 ),

              RefCardHead( text: localizations.diverzumTestJob ),
              SliderBuilder( referenciesList: referenciesList2 ),              
              
              RefCardHead( text: localizations.ffnextTestJob ),
              SliderBuilder( referenciesList: referenciesList3 ),
              
              RefCardHead( text: localizations.referenciesVideos ),
              SliderBuilder( referenciesList: [

                  VideoCardBox(
                    headText: localizations.ote,
                    videoUrl: "https://drive.google.com/uc?export=view&id=1umt44PWimSKh6ejsKqT28rQ515fvXFzE",//'assets/ref_medias/flutter_help_btn.mp4',
                  ),

                  VideoCardBox(
                    headText:  localizations.czurPlanet,
                    videoUrl: "https://drive.google.com/uc?export=view&id=1ZnwOSqAzlGLSr-zMkC-oIl9zG4xCOSHu",//'assets/ref_medias/cruzr_2021_planet.mp4',
                  ),

                  VideoCardBox(
                    headText: localizations.cruzrMVM,
                    videoUrl: "https://drive.google.com/uc?export=view&id=1VyYtoGT-H203LIxBYD-hYvPeNHxuFaGQ",//'assets/ref_medias/cruzr_mvm.mp4',
                  ),

                ],
              ),

              const SizedBox (height: 100 ),
              RefCardLinks( headText: localizations.webLinks )
            ]
          ),
        ),
      ],
    );
  }
}
