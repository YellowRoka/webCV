import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_cv/common/json_workers/data_struct/json_data_struct.dart';
import 'package:web_cv/common/json_workers/json_provider/json_provider.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/cards/data_card.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/cards/job_card.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/cards/school_card.dart';
import 'package:web_cv/pages/home_page/parts/home_page_elements/cards/skills_card.dart';


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

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 6 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 7 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jsonDataPack.jobsEN.jobs[ 8 ] ),
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

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 6 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 7 ] ),
    const SizedBox   ( height: 20 ),

          JobCard    ( description: jsonDataPack.jobsHU.jobs[ 8 ] ),
    const SizedBox   ( height: 20 ),

          SchoolCard ( description: jsonDataPack.baseDataHU.schools[ 0 ] ),
    const SizedBox   ( height: 10 ),

          SchoolCard ( description: jsonDataPack.baseDataHU.schools[ 1 ] ),
    const SizedBox   ( height: 10 ),

          SkillsCard ( description:jsonDataPack. baseDataHU ),
  ];
}
