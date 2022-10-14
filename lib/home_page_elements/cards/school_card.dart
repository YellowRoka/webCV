import 'package:flutter/material.dart';


import '../../json_workers/jsonBasedataObjs.dart';
import 'base_card.dart';

class SchoolCard extends StatelessWidget{
  final Schools description;
  final double? width;
  final double? height;

  const SchoolCard( { Key? key, required this.description, this.width, this.height } ) : super( key: key );
  
  @override
  Widget build( BuildContext context ) {

    const TextStyle textStyle = TextStyle( color:  Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color:  Colors.white, fontSize: 20, decoration: TextDecoration.none );

    return BaseCard( 
      heigt:    height, 
      width:    width,
      children: [
        Column(
          key:                const Key("cschools"),
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  Text( "University: ${description.name}", style: headStyle ), const SizedBox( height: 20 ),
                  Text( "Date:      ${description.date}",  style: textStyle ), const SizedBox( height: 20 ),
            
            const Text( "General Subjects:",               style: textStyle ), const SizedBox( height: 10 ),
                  Text( description.general_subjects,      style: textStyle ), const SizedBox( height: 20 ),

            const Text( "Vocational Subjects:",            style: textStyle ), const SizedBox( height: 10 ),
                  Text( description.vocational_subjects,   style: textStyle ), const SizedBox( height: 20 ),
            
                  Text( "Thesis: ${description.thesis}",   style: textStyle ), const SizedBox( height: 20 ),
            
            const Text( "Brief:",                          style: textStyle ), const SizedBox( height: 5  ),
                  Text( description.brief,                 style: textStyle ), const SizedBox( height: 20 ),
            
                  Text( description.commit??"",            style: textStyle, maxLines: 10, overflow: TextOverflow.ellipsis ),
          ],
        )
      ]
    );
  }
}
