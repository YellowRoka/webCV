import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/json_workers/data_struct/json_data_struct.dart';
import '../../../../common/json_workers/json_provider/json_provider.dart';
import '../../../../common/widgets/base_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'parts/link_line_builder.dart';

class RefCardLinks extends StatelessWidget {
  final String headText;

  const RefCardLinks({Key? key, required this.headText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations  = AppLocalizations.of(context);
    JsonDataStruct?  jsonDataStruct = context.read<JsonDataProvider>().readAllData();

    return BaseCard(
      children: [
        Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
                height: 60,
                child:  Text( headText, style: const TextStyle( color: Colors.white, fontSize: 32 ) )
            ),

            SizedBox(
                height: 30,
                child:  Text( localizations.mediaLinks, style: const TextStyle( color: Colors.white, fontSize: 26 ) )
            ),

            Padding(
              padding: const EdgeInsets.only( left: 16 ),
              child:   Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:           jsonDataStruct!.webLinks.mediaLinks.asMap().entries.map(
                  (entry) => LinkLineBuilder(link: entry.value )
                ).toList(),
              ),
            ),

            const SizedBox( height: 20 ),

            SizedBox(
                height: 30,
                child:  Text( localizations.gitLinks, style: const TextStyle( color: Colors.white, fontSize: 26 ) )
            ),

            Padding(
              padding: const EdgeInsets.only( left: 16 ),
              child:   Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:           jsonDataStruct.webLinks.githubLinks.asMap().entries.map(
                  (entry) => LinkLineBuilder(link: entry.value )
                ).toList(),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
