import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class PraticleBG extends StatelessWidget {
  const PraticleBG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularParticle(
      key:                   UniqueKey(),
      awayRadius:            100,
      numberOfParticles:     500,
      speedOfParticles:      0.5,
      height:                2000,
      width:                 2000,
      onTapAnimation:        true,
      particleColor:       Colors.white.withAlpha( 150 ),
      awayAnimationDuration: const Duration( milliseconds: 1000 ),
      maxParticleSize:       5,
      isRandSize:            true,
      isRandomColor:         true,
      randColorList: [
        Colors.blue.withAlpha(210),
        Colors.purple.withAlpha(210),
        //Colors.yellow.withAlpha(210),
        //Colors.green.withAlpha(210)
      ],
      awayAnimationCurve: Curves.easeInOutBack,
      enableHover:        true,
      hoverColor:       Colors.white,
      hoverRadius:        90,
      connectDots:        false, //not recommended
    );
  }
}
