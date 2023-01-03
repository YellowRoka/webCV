import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_manager_bloc.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( 
      style: ElevatedButton.styleFrom(
        shape:             const CircleBorder(),
        backgroundColor: Colors.black.withOpacity(0.0),
        textStyle:         const TextStyle( color: Colors.white )
      ),
      onPressed: () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventOpenInfoCard() ),
      child:     const Icon( Icons.info_outline, color: Colors.white ),
    );
  }
}
