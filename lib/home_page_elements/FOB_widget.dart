import 'package:flutter/material.dart';

class FOB extends StatelessWidget{
  const FOB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width:  100,
            child:  Builder(
              builder: (context) {
                return FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(0.70),
                  child:           const Icon( Icons.menu_book_sharp ),
                  
                  onPressed: (){
                      Scaffold.of( context ).openDrawer();
                  }
                );
              }
            ),
          ),
        ]
      ),
    );
  }
}
