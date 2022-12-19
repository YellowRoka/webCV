import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/state_manager_bloc.dart';
import '../pages/home_page/parts/scroll_provider/scroll_controller_provider.dart';

class DynamicRoutesHandler extends StatelessWidget {
  const DynamicRoutesHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<StateManagerBloc,StateManagerState>(
      listener: (context, state ){

        
        if( state is StateManagerStateToSplashPage ){
          Navigator.pushNamed( context, "/splash_page" );
        }

        if( state is StateManagerStateToMainPage ){
          context.read<ScrollControllerProvider>().reinit();
          Navigator.pushNamed( context, "/main_page" );
        }
        
        if( state is StateManagerStateToReferencesPage ){
          Navigator.pushNamed( context, "/references_page" );
        }
        
        if( state is StateManagerStateBackToMain ){ 
          Navigator.popUntil( context, ModalRoute.withName( '/main_page' ) );
        
        }
      },
      child: const SizedBox(),
    );
  }
}
