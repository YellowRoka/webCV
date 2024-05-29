import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_cv/bloc/state_manager_bloc.dart';
import 'package:web_cv/common/json_workers/json_provider/json_provider.dart';


class DynamicRoutesHandler extends StatelessWidget {
  const DynamicRoutesHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<StateManagerBloc,StateManagerState>(
      listener: (context, state ) async {

        if(state is StateManagerStateInit){
          Navigator.popUntil( context, ModalRoute.withName( '/' ) );//this need to avoid the double state emitting after restart
          context.read<JsonDataProvider>().load();
        }

        if( state is StateManagerStateToSplashPage ){
          Navigator.pushNamed( context, "/splash_page" );
        }

        else if( state is StateManagerStateToMainPage ){
          Navigator.pushReplacementNamed( context, "/main_page" );
          BlocProvider.of<StateManagerBloc>(context).add( const StateManagerEventPopEnabled() );
        }
        
        else if( state is StateManagerStateToReferencesPage ){
          Navigator.pushNamed( context, "/references_page" );
        }
        
        else if( state is StateManagerStateBackToMain ){ 
          Navigator.popUntil( context, ModalRoute.withName( '/main_page' ) );
        }

        else{}

      },
      child: Container( color: Colors.black ),
      //child: const SplashSreen()
    );
  }
}
