import 'package:flutter/material.dart';

import '../../home_page_elements/cards/data_card.dart';
import '../../home_page_elements/cards/job_card.dart';
import '../../home_page_elements/cards/school_card.dart';
import '../../home_page_elements/cards/skills_card.dart';
import '../../json_workers/jsonReaders.dart';


final List<Widget> dataLinesEN = [
  const SizedBox( height: 10 ),

  _CardLineOf2(
    child1: Column(
      children:[
        DataCard( description: baseDataEN , width: 800 ), 

        const SizedBox( height: 10 ),

        _CardLineOf2( 
          child1: SchoolCard( description: baseDataEN.schools[ 0 ], width: 400 ), 
          child2: SchoolCard( description: baseDataEN.schools[ 1 ], width: 400 ),
        )
      ]
    ), 
    child2: SkillsCard( description: baseDataEN, width: 600 ),
  ),
  
  const SizedBox( height: 10 ), _CardLineOf2( child1: JobCard( description: jobsEN.jobs[ 0 ], width: 700 ), child2: JobCard( description: jobsEN.jobs[ 1 ], width: 700 ) ),
  const SizedBox( height: 10 ), _CardLineOf2( child1: JobCard( description: jobsEN.jobs[ 2 ], width: 700 ), child2: JobCard( description: jobsEN.jobs[ 3 ], width: 700 ) ),
  const SizedBox( height: 10 ), _CardLineOf2( child1: JobCard( description: jobsEN.jobs[ 4 ], width: 700 ), child2: JobCard( description: jobsEN.jobs[ 5 ], width: 700 ) ),
  const SizedBox( height: 10 ),
];

final List<Widget> dataLinesHU = [
  const SizedBox( height: 10 ),

  _CardLineOf2(
    child1: Column(
      children:[
        DataCard( description: baseDataHU , width: 800 ), 

        const SizedBox( height: 10 ),

        _CardLineOf2( 
          child1: SchoolCard( description: baseDataHU.schools[ 0 ], width: 400 ), 
          child2: SchoolCard( description: baseDataHU.schools[ 1 ], width: 400 ),
        )
      ]
    ), 
    child2: SkillsCard( description: baseDataHU, width: 600 ),
  ),
  
  const SizedBox( height: 10 ), _CardLineOf2( child1: JobCard( description: jobsHU.jobs[ 0 ], width: 700 ), child2: JobCard( description: jobsHU.jobs[ 1 ], width: 700 ) ),
  const SizedBox( height: 10 ), _CardLineOf2( child1: JobCard( description: jobsHU.jobs[ 2 ], width: 700 ), child2: JobCard( description: jobsHU.jobs[ 3 ], width: 700 ) ),
  const SizedBox( height: 10 ), _CardLineOf2( child1: JobCard( description: jobsHU.jobs[ 4 ], width: 700 ), child2: JobCard( description: jobsHU.jobs[ 5 ], width: 700 ) ),
  const SizedBox( height: 10 ),
];

class _CardLineOf2 extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  
  const _CardLineOf2( { Key? key, required this.child1, required this.child2 } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ child1, const SizedBox(width: 10), child2 ],
    );
  }
}
