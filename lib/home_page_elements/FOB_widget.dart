import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state_manager_bloc.dart';

class FOB extends StatefulWidget{
  const FOB({Key? key}) : super(key: key);
  
  @override
  State<FOB> createState() => _FOBState();
}

class _FOBState extends State< FOB >{

  late bool isFOBShowed;

  static const double iconSize = 75;

  @override
  void initState(){
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

        if( isFOBShowed == false ){
          return Container();
        }
        else{
          return Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:           [
              ( MediaQuery.of(context).size.width < 1420 )?
              ( const SizedBox(width: 1, height: 1) ):
              ( CommonFOBWidget(
                size:    iconSize,
                cbk:     () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventChangeView() ),
                toolTip: "Change to Grid/List view",
                icon:    Icons.change_circle_outlined,
                //widgetKey: const Key( "FOBPCV" ),
                )
              ),
              
              CommonFOBWidget(
                size:    iconSize,
                cbk:     () => Scaffold.of( context ).openDrawer(),
                toolTip: "Open navigation",
                icon:    Icons.menu_book_sharp 
                //widgetKey: const Key( "FOBD" ),
              ),
              
              CommonFOBWidget(
                size:    iconSize,
                cbk:     () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventSendMail() ),
                toolTip: "Send me an email if you want an offer from me :)",
                icon:    Icons.outgoing_mail,
                //widgetKey: const Key( "FOBM" ),
                ),
              
              CommonFOBWidget(
                size:    iconSize,
                cbk:     () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventCreatePDF() ),
                toolTip: "Create PDF from my CV",
                icon:    Icons.picture_as_pdf_rounded,
                //widgetKey: const Key( "FOBPDF" ),
                ),
              
              CommonFOBWidget(
                size:    iconSize, 
                cbk:     () => BlocProvider.of<StateManagerBloc>( context ).add( const StateManagerEventPopQRDialog() ), 
                toolTip: "Get my conntects",
                icon:    Icons.qr_code_2_rounded,
                //widgetKey: const Key( "FOBQR" ),
              )
            ]
          );
        }
      }
    );
  }
}

class CommonFOBWidget extends StatelessWidget {
  final double       size;
  final String       toolTip;
  final VoidCallback cbk;
  final Key?         widgetKey;
  final IconData     icon;

  const CommonFOBWidget({Key? key, required this.size, required this.toolTip, required this.cbk, this.widgetKey, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width:  size,
      child:  FloatingActionButton(
        key:             widgetKey,
        tooltip:         toolTip,
        backgroundColor: Colors.black.withOpacity( 0.70 ),
        onPressed:       cbk,
        child:           Icon( icon, size: size*0.40 ),
      ),
    );
  }
}
