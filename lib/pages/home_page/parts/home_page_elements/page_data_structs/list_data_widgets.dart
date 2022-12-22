import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/json_workers/data_struct/json_data_struct.dart';
import '../../../../../common/json_workers/json_provider/json_provider.dart';

import '../cards/data_card.dart';
import '../cards/job_card.dart';
import '../cards/school_card.dart';
import '../cards/skills_card.dart';

List<Widget> dataCardsEN( BuildContext context ){

  JsonDataStruct? jsonDataPack = context.read<JsonDataProvider>().readAllData();

  if(jsonDataPack == null ){
    return[ Container() ];
  }

  return [
          DataCard   ( description: jsonDataPack.baseDataEN ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 0 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 1 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 2 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 3 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 4 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 5 ] ),
    const SizedBox   ( height: 20 ),

          SchoolCard ( description: jsonDataPack.baseDataEN.schools[ 0 ] ),
    const SizedBox   ( height: 10 ),

          SchoolCard ( description: jsonDataPack.baseDataEN.schools[ 1 ] ),
    const SizedBox   ( height: 10 ),

          SkillsCard ( description: jsonDataPack.baseDataEN ),
  ];
}

List<Widget> dataCardsHU( BuildContext context ) {

JsonDataStruct? jsonDataPack = context.read<JsonDataProvider>().readAllData();

if(jsonDataPack == null ){
  return[ Container() ];
}

return [
          DataCard   ( description: jsonDataPack.baseDataHU ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 0 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 1 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 2 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 3 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 4 ] ),
    const SizedBox   ( height: 10 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 5 ] ),
    const SizedBox   ( height: 20 ),

          SchoolCard ( description: jsonDataPack.baseDataHU.schools[ 0 ] ),
    const SizedBox   ( height: 10 ),

          SchoolCard ( description: jsonDataPack.baseDataHU.schools[ 1 ] ),
    const SizedBox   ( height: 10 ),

          SkillsCard ( description:jsonDataPack. baseDataHU ),
  ];
}
