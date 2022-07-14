import 'package:flutter/material.dart';

import '../json_workers/jsonBasedataObjs.dart';
import '../json_workers/jsonJobsObjs.dart';


const TextStyle headStyle = TextStyle( color: Colors.black, fontSize: 14, decoration: TextDecoration.none );
const TextStyle textStyle = TextStyle( color: Colors.black, fontSize: 12, decoration: TextDecoration.none );

class PDFCards {
  final JobConverter      jobs;
  final BaseDataConverter baseData;

  const PDFCards( { Key? key, required this.jobs, required this.baseData } );

  List<Widget> widgets() => 
    [
      PDFDataCard( baseData ),
      for( var it in jobs.jobs )PDFWorkCard( it ),
      for( var it in baseData.schools )PDFSchoolCard( it ),
      PDFSkillsCard( baseData )
    ];
}

class PDFBaseCard extends StatelessWidget {
  final List<Widget> children;

  const PDFBaseCard({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular( 25 ),
      child:        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 30 ),
        ),

        child: Padding(
          padding: const EdgeInsets.all( 25 ),
          child:   Row(
            children: [
              const SizedBox(
                width:  30,
                child:  VerticalDivider(thickness: 1, color: Colors.black)
              ),
              
              Column(
                children: children,
              ),
            ],
          ),
        )
      )
    );
  }
}


class PDFDataCard extends StatelessWidget {
  final BaseDataConverter baseData;

  const PDFDataCard( this.baseData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFBaseCard(
      children: [
        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( "Name:   ${baseData.name}",       style: headStyle ), const SizedBox( height: 15 ),
            Text( "Birth:       ${baseData.birth}", style: textStyle ), const SizedBox( height: 15 ),
            Text( "mobile:    ${baseData.mobile}",  style: textStyle ), const SizedBox( height: 15 ),
            Text( "Address:  ${baseData.address1}", style: textStyle ), const SizedBox( height: 15 ),
            Text( "Address:  ${baseData.address2}", style: textStyle ), const SizedBox( height: 15 )
          ],
        )
      ]
    );
  }
}

class PDFWorkCard extends StatelessWidget {
  final JobData job;

  const PDFWorkCard( this.job, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFBaseCard(
      children: [
        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Company:  ${job.company}",       style: headStyle ), const SizedBox( height: 15 ),
                Text("Position:      ${job.position}", style: textStyle ), const SizedBox( height: 15 ),
                Text("Date:            ${job.date}",   style: textStyle ), const SizedBox( height: 15 ),
                Text("Place:          ${job.place}",   style: textStyle ), const SizedBox( height: 15 ),
              ]
            ),
            
            const SizedBox( height: 20 ),

            SizedBox(
              width: 580,
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text( "Tasks:",                 style: headStyle ), const SizedBox( height: 10 ), Text( job.tasks,      style: textStyle ), const SizedBox( height: 30 ),

                  const Text( "Experiences:",           style: headStyle ), const SizedBox( height: 10 ), Text( job.experinces, maxLines: 20, overflow: TextOverflow.ellipsis, style: textStyle ), const SizedBox( height: 30 ),
                  const Text( "Programming languages:", style: headStyle ), const SizedBox( height: 10 ), Text( job.languages,  maxLines: 20, overflow: TextOverflow.ellipsis, style: textStyle ), const SizedBox( height: 30 ),
                  Text( job.commit ?? "",  style: textStyle, maxLines: 20, overflow: TextOverflow.ellipsis )
                ],

              ),
            )
          ],
        )
      ],
    );
  }
}

class PDFSchoolCard extends StatelessWidget {
  final Schools school;

  const PDFSchoolCard( this.school, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return PDFBaseCard( 
      children: [
        SizedBox(
          width: 580,
          child: Column(
            key: const Key("cschools"),
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Text( "University: ${school.name}", style: headStyle ), const SizedBox( height: 20 ),
                    Text( "Date:      ${school.date}",  style: textStyle ), const SizedBox( height: 20 ),
              
              const Text( "General Subjects:",          style: textStyle ), const SizedBox( height: 10 ),
                    Text( school.general_subjects,      style: textStyle ), const SizedBox( height: 20 ),

              const Text( "Vocational Subjects:",       style: textStyle ), const SizedBox( height: 10 ),
                    Text( school.vocational_subjects,   style: textStyle ), const SizedBox( height: 20 ),
              
              const Text( "Thesis:",                    style: textStyle ), const SizedBox( height: 10 ),
                    Text( school.thesis,                style: textStyle, maxLines: 20, overflow: TextOverflow.ellipsis ), const SizedBox( height: 20 ),

              const Text( "Brief:",                     style: textStyle ), const SizedBox( height: 5  ),
                    Text( school.brief,                 style: textStyle, maxLines: 20, overflow: TextOverflow.ellipsis ), const SizedBox( height: 20 ),
              
                    Text( school.commit??"",            style: textStyle ),
            ],
          ),
        )
      ]
    );
  }
}

class PDFSkillsCard extends StatelessWidget {
  final BaseDataConverter baseData;

  const PDFSkillsCard( this.baseData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFBaseCard(
      children: [
        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(width: 580),

            const Text("Langauges:", style: textStyle ), const SizedBox( height: 10 ),
            Text(baseData.languages, style: textStyle ), const SizedBox( height: 30 ),

            const Text("Trainings:", style: textStyle ), const SizedBox( height: 10 ),

            for( var it in baseData.trainings)...[
              Text(it.name, style: textStyle), 
              const SizedBox( height: 20 ),
            ]
          ],
        ), 
      ],
    );
  }
}
