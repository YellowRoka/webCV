import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_cv/common/json_workers/json_provider/json_provider.dart';

import '../bloc/state_manager_bloc.dart';

class DynamicRoutesHandler extends StatelessWidget {
  const DynamicRoutesHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<StateManagerBloc,StateManagerState>(
      listener: (context, state ){

        if( state is StateManagerStateToSplashPage ){
          context.read<JsonDataProvider>().load();
          Navigator.pushNamed( context, "/splash_page" );
        }

        if( state is StateManagerStateToMainPage ){
          Navigator.pushNamed( context, "/main_page" );
        }
        
        if( state is StateManagerStateToReferencesPage ){
          Navigator.pushNamed( context, "/references_page" );
        }
        
        if( state is StateManagerStateBackToMain ){ 
          Navigator.popUntil( context, ModalRoute.withName( '/main_page' ) );
        }
      },
      child: Container( color: Colors.black ),
    );
  }
}
