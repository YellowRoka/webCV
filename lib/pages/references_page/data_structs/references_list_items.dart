import 'package:flutter/material.dart';
import 'package:web_cv/pages/references_page/parts/cards/ref_image_card.dart';


//import 'package:image_network/image_network.dart';

//html.window.open('https://www.fluttercampus.com',"_blank", "location=yes,height=570,width=520,scrollbars=yes,status=yes");
List<Size> referencesSizes = const [
  Size(500, 500),
  Size(500, 700),
  Size(500, 1000),
];

List<Widget> referencesList1 = [
    //"https://drive.google.com/uc?export=view&id=1EAENyLdeSVFeEdPbg56wpiO9K1Aqsowv",
    ["cruzr_1.jpg","1"],
    //"https://drive.google.com/uc?export=view&id=19Bh-N8NE9HHND02XSGewV9tRBLDXgmH5",
    ["cruzr_2.jpg","2"],
    //"https://drive.google.com/uc?export=view&id=1LJ097LJnXHcw6AA5qE9ugYOHteuW7Cwt",
    ["cruzr_3.jpg","3"],
    //"https://drive.google.com/uc?export=view&id=11n95CpbJxAyZK9_agLFw7wa3Ynur-tot",
    ["cruzr_4.jpg","4"],
    //"https://drive.google.com/uc?export=view&id=1acqKmjXxJ_tRBX5HaVcypOZhnabBga8r",
    ["cruzr_5.jpg","5"],
    ["cruzr_6.jpg","6"]
  ].map(_formatterWithIndexedHead).toList();

  List<String> referencesList1Heads = [
    "HUNGEXPO - ITU 2019",
    "HUNGEXPO - ITU 2019",
    "Miskolc - Tudomány fesztivál 2020",
    "Miskolc - Tudomány fesztivál 2022",
    "Paks 2 - Csarnok átadó 2022",
    "Budapest - Office Expo 2019"
  ];

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
        child:     Image( 
          height: 500, 
          width:  800, 
          fit:    BoxFit.contain, 
          image:  AssetImage( "assets/ref_medias/images/$data" )
        ),
        
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

Widget _formatterWithIndexedHead( List<String> data ) =>
  Builder(
    builder: (context) {
      int titleIndex = int.parse( data[1] ) - 1;

      return RefImageCard( 
        height:    700,
        width:     900,
        child:     Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image( 
              height: 500, 
              width:  800, 
              fit:    BoxFit.contain, 
              image:  AssetImage( "assets/ref_medias/images/${data[0]}" )
            ),

              const SizedBox( height: 12 ),
              Center(child: Text( referencesList1Heads[ titleIndex ], style: const TextStyle( color: Colors.white, fontSize:16 ) )),
          ],
        ),
      );
    }
  );
