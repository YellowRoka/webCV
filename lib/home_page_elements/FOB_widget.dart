import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state_manager_bloc.dart';

class FOB extends StatefulWidget{
  const FOB({Key? key}) : super(key: key);

  @override
  State<FOB> createState() => _FOBState();
}

class _FOBState extends State<FOB> {

  late bool isFOBShowed;

  @override
  void initState() {
    isFOBShowed = false;
    super.initState();
  }
  @override
  Widget build( BuildContext context ){
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      builder: ( context, state ){

        if( state is StateManagerStateFOBEnabled ){
          isFOBShowed = true;
        }
        
        if(isFOBShowed == false){
          return Container();
        }
        else{
          return Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ChangeView(),
              OpenDrawer(),
              SendMail(),
              CreatePDF()
            ]
          );
        }
      }
    );
  }
}

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width:  100,
      child:  FloatingActionButton(
        key:             const Key( "FOBD" ),
        tooltip:         "Open menu",
        backgroundColor: Colors.black.withOpacity( 0.70 ),
        child:           const Icon( Icons.menu_book_sharp ),
        
        onPressed: (){
            Scaffold.of( context ).openDrawer();
        }
      ),
    );
  }
}

class SendMail extends StatelessWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ) {
    return SizedBox(
      height: 100,
      width:  100,
      child:  FloatingActionButton(
        key:             const Key( "FOBM" ),
        tooltip:         "Send me an email if you want an offer from me :)",
        backgroundColor: Colors.black.withOpacity( 0.70 ),
        child:           const Icon( Icons.outgoing_mail ),
        
        onPressed: (){
            BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventSendMail() );
        }
      ),
    );
  }
}

class CreatePDF extends StatelessWidget {
  const CreatePDF( { Key? key } ) : super( key: key );

  @override
  Widget build( BuildContext context ) {
    return SizedBox(
      height: 100,
      width:  100,
      child:  FloatingActionButton(
        key:             const Key( "FOBPDF" ),
        tooltip:         "Create PDF from my CV",
        backgroundColor: Colors.black.withOpacity( 0.70 ),
        child:           const Icon( Icons.picture_as_pdf_rounded ),
        
        onPressed: (){
          BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventCreatePDF() );
        }
      ),
    );
  }
}

class ChangeView extends StatelessWidget {
  const ChangeView({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    
    return 
      ( MediaQuery.of(context).size.width < 1420 )?
      ( const SizedBox(width: 1, height: 1)      ):
      ( SizedBox(
        height: 100,
        width:  100,
        child:  FloatingActionButton(
          key:             const Key( "FOBPCV" ),
          tooltip:         "Change to Grid/List view",
          backgroundColor: Colors.black.withOpacity( 0.70 ),
          child:           const Icon( Icons.change_circle_outlined ),
          
          onPressed: (){
            BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventChangeView() );
          })
        )
      );
  }
}
