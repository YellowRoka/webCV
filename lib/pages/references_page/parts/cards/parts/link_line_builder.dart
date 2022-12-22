import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLineBuilder extends StatefulWidget {
  final String link;
  
  const LinkLineBuilder({Key? key, required this.link}) : super(key: key);

  @override
  State<LinkLineBuilder> createState() => _LinkLineBuilderState();
}

class _LinkLineBuilderState extends State<LinkLineBuilder> {
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
