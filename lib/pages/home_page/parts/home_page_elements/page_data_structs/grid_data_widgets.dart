import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/json_workers/data_struct/json_data_struct.dart';
import '../../../../../common/json_workers/json_provider/json_provider.dart';
import '../cards/data_card.dart';
import '../cards/job_card.dart';
import '../cards/school_card.dart';
import '../cards/skills_card.dart';


List<Widget> dataLinesEN( BuildContext context ){

  JsonDataStruct? jsonDataPack = context.read<JsonDataProvider>().readAllData();
  
  if(jsonDataPack == null ){
    return[Container()];
  }

  return [
    const SizedBox( height: 10 ),

    _CardLineOf2(
      child1: Column(
        children:[
          DataCard( description: jsonDataPack.baseDataEN, width: 800 ), 

          const SizedBox( height: 10 ),

          _CardLineOf2( 
            child1: SchoolCard( description: jsonDataPack.baseDataEN.schools[ 0 ], width: 400 ), 
            child2: SchoolCard( description: jsonDataPack.baseDataEN.schools[ 1 ], width: 400 ),
          )
        ]
      ), 
      child2:  SkillsCard( description: jsonDataPack.baseDataEN, width: 590, height: 1225 ),
    ),

    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 0 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 2 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 4 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 6 ], width: 700 ),
          ]
        ),
        
        const SizedBox( width: 10 ),
        
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 1 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 3 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 5 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsEN.jobs[ 7 ], width: 700 ),
          ]
        ),
      ],
    )

  ];
}

List<Widget> dataLinesHU( BuildContext context ){

  JsonDataStruct? jsonDataPack = context.read<JsonDataProvider>().readAllData();
  
  if(jsonDataPack == null ){
    return[Container()];
  }
  
  return [
    const SizedBox( height: 10 ),

    _CardLineOf2(
      child1: Column(
        children:[
          DataCard( description: jsonDataPack.baseDataHU , width: 800 ), 

          const SizedBox( height: 10 ),

          _CardLineOf2( 
            child1: SchoolCard( description: jsonDataPack.baseDataHU.schools[ 0 ], width: 400 ), 
            child2: SchoolCard( description: jsonDataPack.baseDataHU.schools[ 1 ], width: 400 ),
          )
        ]
      ), 
      child2: SkillsCard( description: jsonDataPack.baseDataHU, width: 590, height: 1225 ),
    ),
    
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 0 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 2 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 4 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 6 ], width: 700 ),
          ]
        ),
        
        const SizedBox( width: 10 ),
        
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 1 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 3 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 5 ], width: 700 ),
            const SizedBox( height: 10 ), JobCard( description: jsonDataPack.jobsHU.jobs[ 7 ], width: 700 ),
          ]
        ),
      ],
    )
  ];
}


class _CardLineOf2 extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  
  const _CardLineOf2( { Key? key, required this.child1, required this.child2 } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:           [ child1, const SizedBox( width: 10 ), child2 ],
    );
  }
}
