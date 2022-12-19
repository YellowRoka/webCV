import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'cards/parts/index_markers.dart';


//help: https://blog.codemagic.io/how-to-improve-the-performance-of-your-flutter-app./

class SliderBuilder extends StatefulWidget {
  final List<Widget> referenciesList;
  
  const SliderBuilder({Key? key, required this.referenciesList}) : super(key: key);

  @override
  State<SliderBuilder> createState() => _SliderBuilderState();
}

class _SliderBuilderState extends State<SliderBuilder> {

  late CarouselController? buttonCarouselController;
  late ValueNotifier       indexNotifier;

  @override
  void initState() {
    super.initState();
    buttonCarouselController = CarouselController();
    indexNotifier            = ValueNotifier< int >(0);
  }

  @override
  void dispose() {
    buttonCarouselController = null;
    indexNotifier.dispose();
    super.dispose();
  }
  
  @override
  Widget build( BuildContext context ){
    double screenWidth = MediaQuery.of(context).size.width;
    double pageRation  = ((screenWidth/1920)-0.01>0)?((screenWidth/1920)-0.01):(0.01);

    CarouselOptions carouselOptions = CarouselOptions(
      height:                    700,
      aspectRatio:               6,
      viewportFraction:          0.3 * ( 1 / pageRation ),
      initialPage:               0,
      enableInfiniteScroll:      false,
      reverse:                   false,
      autoPlay:                  false,
      autoPlayInterval:          const Duration( seconds: 7 ),
      autoPlayAnimationDuration: const Duration( milliseconds: 1500 ),
      autoPlayCurve:             Curves.fastOutSlowIn,
      enlargeCenterPage:         true,
      enlargeFactor:             0.3,
      scrollDirection:           Axis.horizontal,
      onPageChanged:             ( (index, reason) => indexNotifier.value = index ),
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        CarouselSlider(
          items:              widget.referenciesList,
          carouselController: buttonCarouselController,
          options:            carouselOptions
        ),

        ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder:         ( context, value, _ ){

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:          widget.referenciesList.asMap().entries.map( 
                (entry) => IndexMarkers( 
                  activeIndex: value as int , 
                  id:          entry.key, 
                  cbk:        (){
                    buttonCarouselController!.animateToPage( entry.key );
                    indexNotifier.value = entry.key;
                  }
                ) 
              ).toList(),
            );
          }
        ),

      ],
    );
  }
}
