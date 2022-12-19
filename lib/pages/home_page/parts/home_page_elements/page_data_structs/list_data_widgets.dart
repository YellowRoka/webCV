  import 'package:flutter/material.dart';
//import 'package:local_hero/local_hero.dart';

import '../../../../../common/json_workers/json_readers.dart';
import '../cards/data_card.dart';
import '../cards/job_card.dart';
import '../cards/school_card.dart';
import '../cards/skills_card.dart';

final List<Widget> dataCardsEN = [
        /*LocalHero( tag: 'id1', child: */DataCard   ( description: baseDataEN )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id2', child: */JobCard    ( description: jobsEN.jobs[ 0 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id3', child: */JobCard    ( description: jobsEN.jobs[ 1 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id4', child: */JobCard    ( description: jobsEN.jobs[ 2 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id5', child: */JobCard    ( description: jobsEN.jobs[ 3 ] )/*)*/,
  const SizedBox   ( height: 20 ),

        /*LocalHero( tag: 'id6', child: */JobCard    ( description: jobsEN.jobs[ 4 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id7', child: */JobCard    ( description: jobsEN.jobs[ 5 ] )/*)*/,
  const SizedBox   ( height: 20 ),

        /*LocalHero( tag: 'id8', child: */SchoolCard ( description: baseDataEN.schools[ 0 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id9', child: */SchoolCard ( description: baseDataEN.schools[ 1 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id10', child: */SkillsCard ( description: baseDataEN )/*)*/,
];


final List<Widget> dataCardsHU = [
        /*LocalHero( tag: 'id1', child: */DataCard   ( description: baseDataHU )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id2', child: */JobCard    ( description: jobsHU.jobs[ 0 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id3', child: */JobCard    ( description: jobsHU.jobs[ 1 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id4', child: */JobCard    ( description: jobsHU.jobs[ 2 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id5', child: */JobCard    ( description: jobsHU.jobs[ 3 ] )/*)*/,
  const SizedBox   ( height: 20 ),

        /*LocalHero( tag: 'id6', child: */JobCard    ( description: jobsHU.jobs[ 4 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id7', child: */JobCard    ( description: jobsHU.jobs[ 5 ] )/*)*/,
  const SizedBox   ( height: 20 ),

        /*LocalHero( tag: 'id8', child: */SchoolCard ( description: baseDataHU.schools[ 0 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id9', child: */SchoolCard ( description: baseDataHU.schools[ 1 ] )/*)*/,
  const SizedBox   ( height: 10 ),

        /*LocalHero( tag: 'id10', child: */SkillsCard ( description: baseDataHU )/*)*/,
];
