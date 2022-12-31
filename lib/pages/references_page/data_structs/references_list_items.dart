import 'dart:ui';

import 'package:flutter/material.dart';

import '../parts/cards/ref_image_card.dart';
//import 'package:image_network/image_network.dart';

//html.window.open('https://www.fluttercampus.com',"_blank", "location=yes,height=570,width=520,scrollbars=yes,status=yes");
List<Size> referencesSizes = const [
  Size(500, 500),
  Size(500, 700),
  Size(500, 1000),
];

List<Widget> referencesList1 = [
    //"https://drive.google.com/uc?export=view&id=1EAENyLdeSVFeEdPbg56wpiO9K1Aqsowv",
    "cruzr_1.jpg",
    //"https://drive.google.com/uc?export=view&id=19Bh-N8NE9HHND02XSGewV9tRBLDXgmH5",
    "cruzr_2.jpg",
    //"https://drive.google.com/uc?export=view&id=1LJ097LJnXHcw6AA5qE9ugYOHteuW7Cwt",
    "cruzr_3.jpg",
    //"https://drive.google.com/uc?export=view&id=11n95CpbJxAyZK9_agLFw7wa3Ynur-tot",
    "cruzr_4.jpg",
    //"https://drive.google.com/uc?export=view&id=1acqKmjXxJ_tRBX5HaVcypOZhnabBga8r",
    "cruzr_5.jpg",
    "cruzr_6.jpg"
  ].map(_formatter).toList();

List<Widget> referencesList2 = [
    //"https://drive.google.com/uc?export=view&id=1esuVRmYj6qPNQ2avDKdQ8lZL7x32VNCF",
    "diverzum_login_1.png",
    //"https://drive.google.com/uc?export=view&id=1aF1PGRKSgFcvV43TC_2JkCzcatIG8a9a",
    "diverzum_list_2.png",
    //"https://drive.google.com/uc?export=view&id=1AUCzy0gXdD2-Q0CQ16jyiTBYF0u3tudr",
    "diverzum_input_3.png",
  ].map(_formatter).toList();

List<Widget> referencesList3 = [
    //"https://drive.google.com/uc?export=view&id=1QVmCjHImIim4gwtwBaAqaH4Xsfx4Rwz-",
    "ff_recipes_1.png",
    //"https://drive.google.com/uc?export=view&id=1lNBxMbFVi3Iwz7V3eVrmGsMWt5es5M9c",
    "ff_recipes_2.png",
    //"https://drive.google.com/uc?export=view&id=1u-NjRYy_ljPSkHRPTTGcFrAwYW4BW66f",
    "ff_recipes_3.png",
    //"https://drive.google.com/uc?export=view&id=1ipKButSZnI3NUclSQ6Gmjmc9uxqqIRE7",
    "ff_recipes_4.png",
  ].map(_formatter).toList();


Widget _formatter( String data ) =>
  Builder(
    builder: (context) {
      return RefImageCard( 
        height:    700,
        width:     900,
        //child: 
          //Container(
            //width:     800, 
            //alignment: Alignment.center,
            child:     Image( 
              height: 500, 
              width:  800, 
              fit:    BoxFit.contain, 
              image:  AssetImage( "assets/ref_medias/images/$data" )
            ),
          //) 
        
        /*child: ImageNetwork( 
          //imageCache: CachedNetworkImageProvider(data),
          image:         data, 
          height:        500, 
          width:         500, 
          fitAndroidIos: BoxFit.contain,
          fitWeb:        BoxFitWeb.contain,
          //fit:BoxFit.contain
        ) 
        */
      );
    }
  );
