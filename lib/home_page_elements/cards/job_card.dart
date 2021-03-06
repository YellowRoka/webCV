import 'package:flutter/material.dart';

import '../../json_workers/jsonJobsObjs.dart';
import 'base_card.dart';

class JobCard extends StatelessWidget {
  final JobData description;  
  const JobCard( { Key? key, required this.description } ) : super( key: key );

  @override
  Widget build(BuildContext context) {

    const TextStyle textStyle = TextStyle( color: Colors.white, fontSize: 18, decoration: TextDecoration.none );
    const TextStyle headStyle = TextStyle( color: Colors.white, fontSize: 20, decoration: TextDecoration.none );

    return BaseCard(
      heigt:    null,
      width:    null,
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.start,
              children: [
                CircleAvatar(  
                  radius:          70,
                  backgroundImage: AssetImage( 'assets/${ description.image }' ),
                ),
                const SizedBox(width: 30),
                Column(
                  key: const Key( "cjobs" ),
                  mainAxisAlignment:  MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text( "Company:  ${description.company}",       style: headStyle ), const SizedBox( height: 15 ),
                    Text( "Position:      ${description.position}", style: textStyle ), const SizedBox( height: 15 ),
                    Text( "Date:            ${description.date}",   style: textStyle ), const SizedBox( height: 15 ),
                    Text( "Place:          ${description.place}",   style: textStyle ), const SizedBox( height: 15 ),
                  ]
                )
              ],
            ),
            
            const SizedBox( height: 20 ),

            Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text( "Tasks:",                 style: headStyle ), const SizedBox( height: 10 ), Text( description.tasks,      style: textStyle ), const SizedBox( height: 30 ),
                const Text( "Experiences:",           style: headStyle ), const SizedBox( height: 10 ), Text( description.experinces, style: textStyle ), const SizedBox( height: 30 ),
                const Text( "Programming languages:", style: headStyle ), const SizedBox( height: 10 ), Text( description.languages,  style: textStyle ), const SizedBox( height: 30 ),
                Text( description.commit??"",  style: textStyle )
              ],
              
            )
          ],
        )
      ],
    );
  }
}
