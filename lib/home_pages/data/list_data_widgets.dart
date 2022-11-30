  import 'package:flutter/material.dart';

import '../../home_page_elements/cards/data_card.dart';
import '../../home_page_elements/cards/job_card.dart';
import '../../home_page_elements/cards/school_card.dart';
import '../../home_page_elements/cards/skills_card.dart';
import '../../json_workers/jsonReaders.dart';

final List<Widget> dataCardsEN = [
        DataCard   ( description: baseDataEN ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsEN.jobs[ 0 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsEN.jobs[ 1 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsEN.jobs[ 2 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsEN.jobs[ 3 ] ),
  const SizedBox   ( height: 20 ),

        JobCard    ( description: jobsEN.jobs[ 4 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsEN.jobs[ 5 ] ),
  const SizedBox   ( height: 20 ),

        SchoolCard ( description: baseDataEN.schools[ 0 ] ),
  const SizedBox   ( height: 10 ),

        SchoolCard ( description: baseDataEN.schools[ 1 ] ),
  const SizedBox   ( height: 10 ),

        SkillsCard ( description: baseDataEN ),
];


final List<Widget> dataCardsHU = [
        DataCard   ( description: baseDataHU ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsHU.jobs[ 0 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsHU.jobs[ 1 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsHU.jobs[ 2 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsHU.jobs[ 3 ] ),
  const SizedBox   ( height: 20 ),

        JobCard    ( description: jobsHU.jobs[ 4 ] ),
  const SizedBox   ( height: 10 ),

        JobCard    ( description: jobsHU.jobs[ 5 ] ),
  const SizedBox   ( height: 20 ),

        SchoolCard ( description: baseDataHU.schools[ 0 ] ),
  const SizedBox   ( height: 10 ),

        SchoolCard ( description: baseDataHU.schools[ 1 ] ),
  const SizedBox   ( height: 10 ),

        SkillsCard ( description: baseDataHU ),
];
