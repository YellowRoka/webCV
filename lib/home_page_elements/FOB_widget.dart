import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state_manager_bloc.dart';

class FOB extends StatelessWidget{
  const FOB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        OpenDrawer(),
        SendMail(),
        CreatePDF()
      ]
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
