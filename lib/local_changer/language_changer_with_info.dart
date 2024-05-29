import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_cv/bloc/state_manager_bloc.dart';
import 'package:web_cv/common/info_line_parts/info_button.dart';
import 'package:web_cv/common/info_line_parts/local_switcher.dart';
import 'package:web_cv/local_changer/locale_provider.dart';



class LanguageChangerWithInfo extends StatelessWidget {
  const LanguageChangerWithInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< StateManagerBloc, StateManagerState >(
      builder: ( context, state ){
        bool locLang = ( context.read<LocaleProvider>().locale == const Locale('en') )?( true ):( false );

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:  Alignment.topCenter,
              end:    Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(1.0),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.0),
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only( right: 10 ),
            child:   Row(
              mainAxisAlignment:  MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[

                const InfoButton(),
                LocalSwitcher(locLang),

              ],
            ),
          ),
        );
      }
    );
  }
}
