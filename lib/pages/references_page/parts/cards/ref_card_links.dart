import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/json_workers/json_readers.dart';
import '../../../../common/widgets/base_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RefCardLinks extends StatelessWidget {
  final String headText;

  const RefCardLinks({Key? key, required this.headText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);

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
                children:           webLinks.mediaLinks.asMap().entries.map(
                  (entry) => LinkBox(link: entry.value )
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
                children:           webLinks.githubLinks.asMap().entries.map(
                  (entry) => LinkBox(link: entry.value )
                ).toList(),
              ),
            ),

          ],
        ),
      ],
    );
  }
}

class LinkBox extends StatefulWidget {
  final String link;
  const LinkBox({Key? key, required this.link}) : super(key: key);

  @override
  State<LinkBox> createState() => _LinkBoxState();
}

class _LinkBoxState extends State<LinkBox> {
  late TextDecoration textUnderLine;
  
  @override
  void initState() {
    super.initState();
    textUnderLine = TextDecoration.none;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,5,0,5),
      child: SizedBox(
        child:  MouseRegion(
          onEnter: (PointerEvent details) => setState( () { textUnderLine = TextDecoration.underline; } ),
          onExit:  (PointerEvent details) => setState( () { textUnderLine = TextDecoration.none;      } ),
          child:   GestureDetector(   
            onTap: ()=>_openUri(widget.link),
            child: Text( widget.link, overflow: TextOverflow.ellipsis, maxLines: 10, style: TextStyle( color: Colors.white, fontSize: 24, decoration: textUnderLine) )),
        ),
      ),
    );
  }

  Future<void> _openUri(String link) async {
    final linkUri = Uri.parse(link);

    if(!await launchUrl(linkUri)) {
      throw 'Could not launch $link';
    }
  }
}
